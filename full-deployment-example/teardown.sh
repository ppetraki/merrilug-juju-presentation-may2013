#!/bin/bash -x
repo="--repository=$(pwd)/charms"

if [ -z $JUJU_ENV ]; then
  echo "no juju env defined!"
  exit 1
fi

yes | juju destroy-environment

# vim:ts=2:sw=2:et: 
