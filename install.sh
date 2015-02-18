#!/bin/bash

curl -skL https://github.com/bixu/global_zone_addons/tarball/master | gtar xvz

mv bixu-global_zone_addons-* global_zone_addons

cd global_zone_addons

for script in $(ls addons.d); do
	$script
done
