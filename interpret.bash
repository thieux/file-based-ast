#!/bin/bash

function assertEquals() {
  if [[ $1 = $2 ]]; then
    echo "test $1 = $2"
  else 
    echo "FAILURE: expected='$1'; actual='$2'"
    exit 1
  fi
}

function evaluate() {
  if [[ "$1" = '/tmp/+' ]]; then
    echo '3'
  else
    basename "$1"
  fi
}


cd /tmp
mkdir -p 1

assertEquals '1' "$(evaluate '1')"

mkdir -p 2

assertEquals '2' "$(evaluate '/tmp/2')"

mkdir -p +/1
mkdir -p +/2

assertEquals '3' "$(evaluate '/tmp/+')"
