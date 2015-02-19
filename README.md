# global_zone_addons
Add tools and programs to a SmartOS global zone in a minimally-invasive way.

#### bootstrapping

##### safer
```
export NEWRELIC_LICENSE_KEY=<your newrelic license key>
curl -sLOk https://raw.githubusercontent.com/bixu/global_zone_addons/master/install.sh; less install.sh; ./install.sh
```
##### faster
```
export NEWRELIC_LICENSE_KEY=<your newrelic license key>
curl -sLk https://raw.githubusercontent.com/bixu/global_zone_addons/master/install.sh | bash -s
```
