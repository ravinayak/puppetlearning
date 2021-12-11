#!/bin/bash
sudo r10k puppetfile install --verbose
sudo puppet apply manifests/manualpuppet-practice.pp
