#!/bin/bash

cd `dirname $0`

APACHE_CTL=/opt/local/apache2/bin/apachectl
SITES_AVAILABLE_DIR=sites_available
SITES_ENABLED_DIR=sites_enabled

function restart_apache(){
    echo "- Restarting Apache2"
    sudo launchctl unload -w /Library/LaunchDaemons/org.macports.apache2.plist
    sudo launchctl load -w /Library/LaunchDaemons/org.macports.apache2.plist 
}

function file_not_exist(){
    echo "File $1 does not exists"
}

case $1 in

"enable") 
    FILE=$SITES_AVAILABLE_DIR/$2.conf
    DEST=$SITES_ENABLED_DIR/$2.conf
    if [ -f $FILE ] ; then
        echo "- Copying the $FILE file"
        cp $FILE $DEST
        echo "- Checking $2.conf syntax"
        R=`$APACHE_CTL configtest 2>&1`
        if [ "xSyntax OK" = "x$R"  ] ; then
            echo "    "$R
            restart_apache
        else
            rm $DEST
            echo "- Configuration error: "$R
        fi
    else
        file_not_exist $FILE
    fi
    ;;
"disable") 
    FILE=$SITES_ENABLED_DIR/$2.conf
    if [ -f $FILE ] ; then
        echo "removing the $2.conf file"
        rm $FILE
        restart_apache
    else
        file_not_exist $FILE
    fi
    ;;
esac