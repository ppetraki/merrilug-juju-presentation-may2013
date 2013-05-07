#!/bin/bash
repo="--repository=$(pwd)/charms"

if [ -z $JUJU_ENV ]; then
  echo "no juju env defined!"
  exit 1
fi

juju bootstrap
sleep 90
juju status 2>&1>&/dev/null

juju deploy $repo local:mysql
juju deploy $repo local:mediawiki

juju expose mediawiki

# juju add-relation mysql mediawiki


# vim:ts=2:sw=2:et: 
