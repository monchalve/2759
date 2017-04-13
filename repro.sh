#!/bin/bash

mkdir -p /tmp/ab
cp ext/* /tmp/ab

# clean and shutdown so that we're starting from a known state
bazel clean
bazel shutdown

# check out the initial state
git checkout start

bazel build //repro:repro_2759

# check out the new state; try to repro
git checkout master

bazel build //repro:repro_2759
