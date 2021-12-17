#!/bin/bash
sudo r10k puppetfile install --verbose
sudo puppet apply manifests/manualpuppetpractice.pp
