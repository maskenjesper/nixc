#!/usr/bin/env bash

pushd ~/dev || exit
time=$(date "+%H-%M-%S_%d-%m-%y")
mkdir $time
cd $time
dir=$(pwd)

echo $dir

~/.scripts/tmux-sessionizer.sh $dir
