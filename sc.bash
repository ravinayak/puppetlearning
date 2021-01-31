#!/bin/bash
changed_file="manifests/$file"
cp ../examples/"$file" manifests/.
git add $changed_file
git commit -m "Checking Changes in"
git push -u origin master

