Horus Distribution
===================

Welcome to the Horus distribution - a fully-functional e-commerce application built using [Elcodi](https://github.com/Symfomany/elcodi) components featuring a simple front-end and a backoffice administrator.


[Composer][1] is required to manage dependencies.

if you have not yet installed Composer, download it following the instructions on
http://getcomposer.org/ or just run the following command:

```bash
    $ curl -s http://getcomposer.org/installer | php
```

Requirements
------------------

The application uses [Vagrant](http://www.vagrantup.com/) to set up and configure a development environment with a fully set-up web application.

### 1. Get the code by cloning this repo

```bash
    $ git clone https://github.com/elcodi/bamboo-distribution.git
```

### 2. Run `composer update`

It's better that you run the `composer update` in the host machine, before booting the virtual machine, since the update process is generally very memory intensive

```bash
   # Be sure you are in the bamboo-distribution directory
   $ composer update --prefer-source
```

### 3. Download and install Vagrant

Get and install Vagrant from the [official download page](http://www.vagrantup.com/downloads).

### 4. Edit your `hosts` file

Edit you `hosts` file by adding:

```
10.10.10.10   bamboo.dev
```

In linux and OSX, it is located in `/etc/hosts`. In windows7-8 you can find it in `C:\Windows\System32\drivers\etc\hosts` (you will need to edit the file as *administrator*) 

### 5. Crank up the virtual machine

Enter the `vagrant` directory of the code tree and initialize the environment.

```bash
$ cd vagrant
$ vagrant up
```

### 6. Go get some coffee

When the vagrant provisioning is done, point your browser to `http://bamboo.dev` and you are done!

### 7. Logging into the backoffice

Point your browser to `http://bamboo.dev/admin` and use the following credentials:

```
email: admin@admin.com
password: 1234
```

### 8. Play!

Look at the [example bundles](https://github.com/elcodi/bamboo-distribution/tree/master/src/Elcodi/AdminExampleBundle) to see how to extend and customize the front and backoffice web applications.


[1]:  http://getcomposer.org/
