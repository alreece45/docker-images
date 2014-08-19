#!/bin/sh

for df in `find -name Dockerfile`
do
    dir=`dirname $df`
    target="build/$dir"

    echo " >> Preparing $dir"
    mkdir -p $target
    tar cvf - $dir -h | (tar xvf - -C build/)
done
