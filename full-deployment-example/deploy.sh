#!/bin/bash
repo="--repository=$(pwd)/charms"

if [ -z $JUJU_ENV ]; then
  echo "no juju env defined!"
  exit 1
fi

# use charm search <charm name> to locate these services

juju bootstrap
sleep 90
juju status 2>&1>&/dev/null

juju deploy $repo local:lamp -n 3
juju deploy $repo local:haproxy
juju add-relation haproxy lamp

juju deploy $repo local:ganglia
juju deploy $repo local:ganglia-node

juju deploy $repo local:siege 

juju add-relation ganglia-node lamp
juju add-relation ganglia-node:node ganglia:node


for unit in lamp/0 lamp/1 lamp/2; do
  jitsu watch $unit \
    --state=started --state=install-error --state=start-error
done

jitsu watch ganglia/0 \
  --state=started --state=install-error --state=start-error

for service in lamp haproxy ganglia; do
  juju expose $service
done

juju status ganglia | grep public-address # open this up IP/ganglia/

# OK human, get that web browser open
echo "please point browser to ganglia public-address/ganglia/"
sleep 30

# and now some eye candy
echo "beginning siege"
juju add-relation siege haproxy

# vim:ts=2:sw=2:et: 
