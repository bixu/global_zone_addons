#!/bin/bash

if [ ! -e /opt/local/bin/pkgin ]; then
  echo "bootstrapping pkgsrc..."
  ./pkgsrc.sh
  echo "...done"
fi

curl -skOL https://github.com/circonus-labs/nad/tarball/master

gtar -xf master

pkgin -y install build-essential nodejs

# run make from the latest unpacked tarball only
cd $(ls -lrtd circonus* | tail -n1 | awk '{print $9}')

gmake install-illumos > make.log

svccfg import /var/svc/manifest/network/circonus/nad.xml

cp /var/svc/manifest/network/circonus/nad.xml /opt/custom/smf/
