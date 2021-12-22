#!/bin/bash
cd /codetestfiles/puppetlabs/code/environments/production/puppetlearning && git pull
/opt/puppetlabs/bin/puppet apply manifests/
