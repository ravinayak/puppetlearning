# Run this script as one of the following. Suppose in the examples folder you have a file run.pp - 'examples/run.pp', then you want to copy the file from examples directory to 
# manifests folder into puppet repo and commit those files to git
# a. bash sc.bash <run.pp>
# b. ./sc.bash <run.pp>
#!/bin/bash
changed_file="manifests/$1"
echo $changed_file
cp ../examples/"$file" manifests/.
git add $changed_file
git commit -m "Checking Changes in"
git push -u origin master

