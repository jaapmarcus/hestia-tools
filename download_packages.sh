#!/bin/bash

#Versions
hestia="1.5.3~alpha"
hestianginx="1.21.5"
hestiaphp="7.4.27"

#OS 
os=$(lsb_release -s -i | tr '[:upper:]' '[:lower:]');
version=$(lsb_release -s -r | tr '[:upper:]' '[:lower:]' | sed 's/\.//g');
codename="$(lsb_release -s -c)"
aarch=$(dpkg --print-architecture)

echo "OS: $os"
echo "Version: $version"
echo "Architecture: $aarch"

#Download packages 
wget "https://apt.hestiacp.com/beta/${os}/${codename}/hestia_${hestia}_${aarch}.deb"
wget "https://apt.hestiacp.com/beta/${os}/${codename}/hestia-nginx_${hestianginx}_${aarch}.deb"
wget "https://apt.hestiacp.com/beta/${os}/${codename}/hestia-php_${hestiaphp}_${aarch}.deb"
