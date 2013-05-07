#!/bin/bash

rm   -rf charms/precise
mkdir -p charms/precise

bzr branch lp:charms/lamp charms/precise/lamp
bzr branch lp:charms/haproxy charms/precise/haproxy

bzr branch lp:~dannf/charms/precise/siege/trunk charms/precise/siege

bzr branch lp:charms/ganglia charms/precise/ganglia
bzr branch lp:charms/ganglia-node charms/precise/ganglia-node

# vim:ts=2:sw=2:et:
