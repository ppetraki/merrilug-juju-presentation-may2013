#!/bin/bash
repo="--repository=$(pwd)/charms"

if [ -z $JUJU_ENV ]; then
  echo "no juju env defined!"
  exit 1
fi

juju bootstrap
sleep 90
juju status 2>&1>&/dev/null

juju deploy $repo local:opengrok

jitsu watch opengrok/0 \
  --state=started --state=install-error --state=start-error

juju expose opengrok

juju status opengrok | grep public-address

# vim:ts=2:sw=2:et: 
