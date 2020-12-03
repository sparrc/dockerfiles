#!/usr/bin/env bash
set -ex

for d in $(ls -d */); do
    make -C "$d"
done
