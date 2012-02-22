#!/bin/bash

for i in *.m; do
  echo "Converting $i"
  tr '\t' ' ' < $i > /tmp/vistatemporaryfile.m
  cp /tmp/vistatemporaryfile.m $i
done
