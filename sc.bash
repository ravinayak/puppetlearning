# Run this script as one of the following. Suppose in the examples folder you have a file run.pp - 'examples/run.pp', then you want to copy the file from examples directory to 
# manifests folder into puppet repo and commit those files to git
# a. bash sc.bash <run.pp>
# b. ./sc.bash <run.pp>
#!/bin/bash
cp ../examples/"$1" manifests/.
git add manifests/"$1"
git commit -m "Checking Changes in"
git push -u origin master

