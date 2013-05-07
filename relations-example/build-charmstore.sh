#!/bin/bash
rm -rf   charms/precise
mkdir -p charms/precise

bzr branch lp:~peter-petrakis/charms/precise/rsetter/trunk charms/precise/rsetter
bzr branch lp:~peter-petrakis/charms/precise/rgetter/trunk charms/precise/rgetter

bzr branch lp:charms/mediawiki charms/precise/mediawiki
bzr branch lp:charms/mysql     charms/precise/mysql
# vim:ts=2:sw=2:et:
