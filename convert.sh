#!/bin/bash
# Creating the submodule 
rm -r ORIGINAL_REPO
git clone git@github.com:USERNAME/ORIGINAL_REPO.git
cd ORIGINAL_REPO
git filter-branch --prune-empty --subdirectory-filter $1 master
git remote set-url origin git@github.com:USERNAME/$1.git
git push -u origin master

# deleting the directory and append the submodule to it
cd ../../ORIGINAL_REPO
git remote -v
git rm -r $1
git commit -m "Remove $1 (preparing for submodule)"
git submodule add git@github.com:USERNAME/$1.git $1
git commit -m "$1 submodule"
git push -u origin master
