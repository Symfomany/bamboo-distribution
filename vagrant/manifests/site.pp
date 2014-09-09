# -*- mode: ruby -*-
# vi: set ft=ruby :

group { 'puppet': ensure => present }

file { "/home/vagrant/bamboo-distribution":
    ensure => "directory",
    owner  => "vagrant",
    group  => "vagrant",
    mode   => 775,
}

class {'apt':
    always_apt_update => true
}

package {
    [
        'imagemagick',
        'vim',
        'htop',
        'php5-cli',
        'git'
    ]:
    ensure => 'latest'
}

class { 'apache':
    default_mods => false,
    mpm_module   => 'prefork',
    user         => 'vagrant',
    group        => 'vagrant'
}

include apache::mod::rewrite
include apache::mod::php

include php
include php::params
include php::extension::mysql
include php::extension::intl

class { ['php::composer', 'php::composer::auto_update']:

}

php::config { 'opcache.enable_cli=1':
    file    => '/etc/php5/cli/conf.d/05-opcache.ini',
    require   => Package['php5-cli']
}

apache::vhost { 'bamboo.dev':
    port          => '80',
    docroot       => '/home/vagrant/bamboo-distribution/web',
    docroot_owner => 'vagrant',
    docroot_group => 'vagrant',
    directories   => [
        {
            path           => '/home/vagrant/bamboo-distribution/web',
            options        => ['Indexes','FollowSymLinks','MultiViews'],
            allow_override => ['all'],
            allow => 'from All'
        },
    ],
    serveradmin => 'admin@bamboo.dev',
}

class { 'mysql::server':
    root_password => 'root'
}

class { 'mysql::client':

}

exec { "console_database_create":
    command     => '/usr/bin/php /home/vagrant/bamboo-distribution/app/console doc:dat:cre &&
                    /usr/bin/php /home/vagrant/bamboo-distribution/app/console doc:sch:cre &&
                    /usr/bin/php /home/vagrant/bamboo-distribution/app/console doc:fix:load --no-interaction --fixtures=/home/vagrant/bamboo-distribution/vendor/elcodi/bamboo-fixtures &&
                    /usr/bin/php /home/vagrant/bamboo-distribution/app/console assets:install /home/vagrant/bamboo-distribution/web --symlink &&
                    /usr/bin/php /home/vagrant/bamboo-distribution/app/console assetic:dump',
    user        => 'vagrant',
    cwd         => '/home/vagrant/bamboo-distribution',
    logoutput   => true,
    require     => Package['php5-cli']
}
