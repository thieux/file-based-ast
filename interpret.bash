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
  if [[ "$1" = '2' ]]; then
    echo '2'
  else
    echo '1'
  fi
}


cd /tmp
mkdir -p 1

assertEquals '1' "$(evaluate '1')"

mkdir -p 2

assertEquals '2' "$(evaluate '2')"

