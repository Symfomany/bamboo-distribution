Bamboo Distribution
===================

Welcome to the Bamboo distribution - a fully-functional e-commerce application featuring a front-end and a backoffice administrator.

It is a basic Symfony application that packages [Bamboo Store](https://github.com/elcodi/bamboo-store) and [Bamboo Admin](https://github.com/elcodi/bamboo-admin) in a single code repository, installing them as dependencies in the `vendor` directory.

[Composer][1] is required to manage dependencies.

If you don't have Composer yet, download it following the instructions on
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
### 2. Download and install Vagrant

Get and install Vagrant from the [official download page](http://www.vagrantup.com/downloads).

### 3. Edit your `host` file

Edit you `hosts` file by adding:

```
10.10.10.10   bamboo.dev
```

In linux and OSX, it is located in `/etc/hosts`. In windows7-8 you can find it in `C:\Windows\System32\drivers\etc\hosts` (you will need to edit the file as *administrator*) 
### 4. Crank up the virtual machine

Enter the `vagrant` directory of the code tree and initialize the environment.

```bash
$ cd vagrant
$ vagrant up
```

### 5. Go get some coffee

When the vagrant provisioning is done, point your browser to ``http://bamboo.dev` and you are done!


[1]:  http://getcomposer.org/