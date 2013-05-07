#!/bin/bash

rm   -rf charms/precise
mkdir -p charms/precise

bzr branch lp:charms/opengrok charms/precise/opengrok
# vim:ts=2:sw=2:et:
