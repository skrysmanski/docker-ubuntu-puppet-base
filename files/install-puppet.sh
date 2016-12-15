#!/bin/bash -e
# See: https://docs.puppet.com/puppet/latest/reference/install_linux.html

export DEBIAN_FRONTEND=noninteractive

# Install packages required for installation
apt-get install -y --no-install-recommends wget lsb-release ca-certificates

PUPPET_COLLECTION=pc1
VERSION_CODENAME=`lsb_release -s -c`

FULL_FILE_NAME=puppetlabs-release-${PUPPET_COLLECTION}-${VERSION_CODENAME}.deb
wget https://apt.puppetlabs.com/$FULL_FILE_NAME

# Remove dependencies again
apt-get remove --purge -y wget lsb-release ca-certificates
apt-get autoremove --purge -y

dpkg -i $FULL_FILE_NAME

apt-get update

apt-get install puppet-agent

# Remove downloaded file
rm $FULL_FILE_NAME

# Create symlinks
PUPPET_BIN_DIR=/opt/puppetlabs/bin

for file in $PUPPET_BIN_DIR/*; do
	ln -s "$file" /usr/bin/
done
