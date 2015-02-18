#!/bin/bash

if [ ! -e /opt/local/bin/pkgin ]; then
  	echo "bootstrapping pkgsrc..."
	BOOTSTRAP_TARBALL=$(curl -sLk http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/ | grep href= | cut -d\" -f2 | tail -n1)

	cd /

	curl -k http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/$BOOTSTRAP_TARBALL | gzcat | tar -xf -

	pkg_admin rebuild
fi