#!/bin/bash

# Download installer of a random branch and add beta repo info

user=$1
branch=$2

if [ -z "$user" ]; then 
    echo "Unknown Username";
    exit 1;
fi

if [ -z "$branch" ]; then 
    echo "Unknown branchname";
    exit 1;
fi

for installer in debian ubuntu; do
    # Download installers
    # Use ipv4 only shame on you Github
    wget --inet4-only "https://raw.githubusercontent.com/$user/hestiacp/$branch/install/hst-install-$installer.sh"
    # Remove development check
    # Note: Also remvoves non supported Architecture
    sed -i '/check_result 1 "Installation aborted"/d' hst-install-$installer.sh
    sed -i 's/deb \[arch=\$ARCH signed-by=\/usr\/share\/keyrings\/hestia-keyring\.gpg\]/#deb \[arch=\$ARCH signed-by=\/usr\/share\/keyrings\/hestia-keyring\.gpg\]/g' hst-install-$installer.sh
    sed -i '/# Installing HestiaCP repo/a insert-line2'  hst-install-$installer.sh
    sed -i '/# Installing HestiaCP repo/a insert-line1'  hst-install-$installer.sh
    sed -i 's/insert-line1/deb \[arch=\$ARCH signed-by=\/usr\/share\/keyrings\/hestia-beta-keyring\.gpg\] https:\/\/beta\.hestiacp\.com\/ \$codename main" > \$apt\/hestia-beta\.list/g' hst-install-$installer.sh
    sed -i 's/insert-line2/curl -s "https:\/\/beta\.hestiacp\.com\/pubkey\.gpg" | gpg --dearmor | tee \/usr\/share\/keyrings\/hestia-beta-keyring\.gpg  >\/dev\/null 2>\&1/g' hst-install-$installer.sh
done