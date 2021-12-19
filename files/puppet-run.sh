#!/bin/bash
cd /codetestfiles/puppetlabs/code/environments/production/puppet-learning && git pull
/opt/puppetlabs/bin/puppet apply manifests/
