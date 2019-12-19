#!/bin/bash

version=$(git describe --abbrev=0 --tags)
version=${version:2} # Remove the v in the tag v0.37.10 for example
oldVersion=( ${version//./ } )
((oldVersion[2]++))
next_version="${oldVersion[0]}.${oldVersion[1]}.${oldVersion[2]}"
git checkout -b v-${next_version}
git push origin v-${next_version}
git checkout master
git tag -a v-${next_version} -m v-${next_version}
git push --tags origin master
