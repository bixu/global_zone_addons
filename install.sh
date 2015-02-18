#!/bin/bash

curl -skL https://github.com/bixu/global_zone_addons/tarball/master | gtar xvz

cd $(ls -lrtd global_zone_addons* | tail -n1 | awk '{print $9}')

for script in $(ls addons.d); do
	$script
done
