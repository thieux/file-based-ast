#!/bin/bash

function assertEquals() {
  if [[ $1 = $2 ]]; then
    echo "test $1 = $2"
  else 
    echo "FAILURE: expected=$1; actual=$2"
    exit 1
  fi
}

cd /tmp
mkdir -p 1

assertEquals '1' "$(evaluate '1')"
