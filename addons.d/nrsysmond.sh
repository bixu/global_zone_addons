#!/bin/bash

if [ -z ${NEWRELIC_LICENSE_KEY+x} ]; then
  echo "You need to set the NEWRELIC_LICENSE_KEY environment variable. Exiting..."
  exit 1
fi

if [ ! -e /opt/local/bin/pkgin ]; then
  ./addons.d/pkgsrc.sh
fi

pkgin -y install nrsysmond

echo "
license_key=$NEWRELIC_LICENSE_KEY
loglevel=info
logfile=/var/log/newrelic/nrsysmond.log
" > /opt/local/etc/nrsysmond.cfg

svcadm enable nrsysmond
