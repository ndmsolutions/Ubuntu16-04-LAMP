# LAMP-Stack for Ubuntu 16.04 Tested on (DigitalOcean, Vultr, AWS)

The following are installed:

* Apache 2.4
* MySQL v5.7
* PHP 7.0
* Postfix mail server (securely configured to be outgoing only)
* FTP Server
* PhpMyAdmin


New Features:

1. Add Database from CLI.
1. Add User For Domain and FTP access.
1. Add Automatic User after disabling root user for login.
1. Manage Swap Size
1. Manage Root Access

Installing:

```
apt-get install git -y

```

Clone Repository

```
git clone https://github.com/ndmsolutions/Ubuntu16-04-LAMP.git lamp

```

CD to Directory and Change permission

```
cd lamp
chmod 700 *.sh
chmod 700 options.conf
```

Edit options to enter server IP, MySQL password etc.

```
#To generate strong password for MySQL use:
</dev/urandom tr -dc '123465!@^[]%q*JdueNhgSyHD]%q*ylIuj' | head -c18; echo ""

nano config.conf
```

Install LAMP.

```
./install.sh

```

When install is completed you will find user and password generated during install.


```
cat info_install.txt
#### User with Sudo Access #####
User: sysadmin
Pass: 074VohJv9P6tx4hcFG8AzT2o
```

Install FTP and PhpMyAdmin

```
./setup.sh ftp

./setup.sh dbgui
```
****************** AWS Ec2 *************************

Also for FTP if using on AWS Ec2 you need to open ports 

Port range 40000 - 40100

SERVER_IP from options.conf will be used for "pasv_address=$SERVER_IP"

****************** End AWS Ec2 **********************


Add User for Domain to be started.

```
./add_domain_user.sh myuser
```

Add Domain to user we created.

```
./domain.sh add myuser mydomain.com
```

Enable PhpMyAdmin if installed.

```
./domain.sh dbgui on 

'/home/myuser/domains/mydomain.com/public_html/dbgui' -> '/usr/local/share/phpmyadmin/'
```

Disable PhpMyAdmin

```
./domain.sh dbgui off
```

Create MySQL User and Database.

```
./database.sh add myusersql

 ################# DB Info ######################
 Database Added
 Host: localhost
 Port: 3306
 User: myusersql
 Pass: Ujtb8dC3O9dRhgmXe5rMCJUL
```

Drop MySQL User and Database.

```
./database.sh drop myusersql

 ################# DB Info ######################
 Database Removed and User
 User: myusersql
```

Manage Swap Memory, added this to work on DigitalOcean as was Issue for low memory in 512MB you can change as per need Swap at options.conf:

```
ADD_SWAP=yes
SWAP_SIZE=2G
```

Users wish SSL sites make sure you generate DHPARAM and not using existing one change this to options.conf from DHPARAM_SETUP=1 to DHPARAM_SETUP=2 this will take long time while install.
You can use DHPARAM_SETUP=1 only for testing server and destroy.

```
#How to generate dhparam manually
openssl dhparam -out /etc/nginx/ssl/dhparam.pem 4096
```

```
DHPARAM_SETUP=2
```

Install Wordpress:

```
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz

mv wordpress/* ./

rmdir ./wordpress/
rm -f latest.tar.gz

# change "define('WP_MEMORY_LIMIT', '256M');" in wp-config.php

#todo
max_input_vars = 2000

```
