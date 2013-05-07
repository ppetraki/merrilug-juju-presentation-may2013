#!/bin/bash
repo="--repository=$(pwd)/charms"

if [ -z $JUJU_ENV ]; then
  echo "no juju env defined!"
  exit 1
fi

juju bootstrap
sleep 90
juju status 2>&1>&/dev/null

juju deploy $repo local:rsetter
juju deploy $repo local:rgetter

# juju add-relation rsetter rgetter

# vim:ts=2:sw=2:et: 
