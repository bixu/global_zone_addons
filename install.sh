#!/bin/bash

curl -skL https://github.com/bixu/global_zone_addons/tarball/master | gtar xz

cd $(ls -lrtd bixu-global_zone_addons* | tail -n1 | awk '{print $9}')

for script in $(ls ./addons.d); do
	./addons.d/$script
done
