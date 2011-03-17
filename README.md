# Enable Sites #

## About ##

Manage apache2 virtual hosts in Mac ala Ubuntu:

	$ ./es.sh enable mysite
	- Copying the sites_available/mysite.conf file
	- Checking mysite.conf syntax
	    Syntax OK
	- Restarting Apache2

## Usage ##

Clone this repository and give executing permission to the `es.sh` file.

- Put your vhosts files in a folder called "sites_available"
- Create a folder called "sites_enabled"
- Add this line to your apache httpd.conf below the vhosts entry:

	Include /Users/mrhyde/liip/sites_enabled/

- Create the file `sites_available/mysite.conf` and setup your vhost there.

To enable a site run:

	./es.sh enable mysite
	
To disable a site run:

	./es.sh disable mysite

## Configuration ##

Modify the following scripts variables to match your setup:

	APACHE_CTL=/opt/local/apache2/bin/apachectl
	SITES_AVAILABLE_DIR=sites_available
	SITES_ENABLED_DIR=sites_enabled

## Extra ##

If you don't want to be messing around with the `/etc/hosts` file do yourself a favor and install [Ghost](http://thechangelog.com/post/434045062/ghost-means-never-having-to-touch-etc-hosts-again)

# NOTES #

Only tested with apache2 installed using Mac Ports. This is a very poor's man solution to this problem. Feel free to improve it or to point me to a better one. 

This is my first Bash project so it might make you cry if you are a serious Bash user.

## License ##

See: LICENSE.md