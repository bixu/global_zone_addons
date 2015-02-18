#!/bin/bash

if [ ! -z NEWRELIC_LICENSE_KEY ]; then
  echo "You need to set the NEWRELIC_LICENSE_KEY environment variable. Exiting..."
  exit 1
fi

if [ ! -e /opt/local/bin/pkgin ]; then
  echo "bootstrapping pkgsrc..."
  ./pkgsrc.sh
  echo "...done"
fi

pkgin -y install nrsysmond

echo "
license_key=$NEWRELIC_LICENSE_KEY
loglevel=info
logfile=/var/log/newrelic/nrsysmond.log
" > /opt/local/etc/nrsysmond.cfg

svcadm enable nrsysmond
