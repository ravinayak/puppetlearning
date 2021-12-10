#!/bin/bash
sudo vim Puppetfile
sudo r10k puppetfile install --verbose
sudo puppet apply manifests/manualpracticepuppet.pp
