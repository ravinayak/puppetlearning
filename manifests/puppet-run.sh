#!/bin/bash
cd /codetestfiles/puppetlabs/code/environments/production && git pull
/opt/puppetlabs/bin/puppet apply manifests/
