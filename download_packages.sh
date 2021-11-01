#!/bin/bash

#Versions
hestia="1.5.0~beta"
hestianginx="1.21.3"
hestiaphp="7.4.25"

#OS 
os=$(lsb_release -s -i | tr '[:upper:]' '[:lower:]');
version=$(lsb_release -s -r | tr '[:upper:]' '[:lower:]' | sed 's/\.//g');
aarch=$(dpkg --print-architecture)

echo "OS: $os"
echo "Version: $version"
echo "Architecture: $aarch"

#Download packages 
wget "https://apt.hestiacp.com/beta/${os}-${version}/hestia_${hestia}_${aarch}.deb"
wget "https://apt.hestiacp.com/beta/${os}-${version}/hestia-nginx_${hestianginx}_${aarch}.deb"
wget "https://apt.hestiacp.com/beta/${os}-${version}/hestia-php_${hestiaphp}_${aarch}.deb"
