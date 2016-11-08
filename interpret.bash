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
  local name=$(basename "$1")

  if [[ "$name" = '+' ]]; then
    local operands=(```/bin/ls "$1"```)
    local leftTerm="${operands[0]}"
    local rightTerm="${operands[1]}"
 
    echo $(($(evaluate "$1/$leftTerm") + $(evaluate "$1/$rightTerm")))
  else
    echo "$name"
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

mkdir -p sum/+/2
mkdir -p sum/+/3

assertEquals '5' "$(evaluate '/tmp/sum/+')"

mkdir -p nested_sum/+/1
mkdir -p nested_sum/+/+/2
mkdir -p nested_sum/+/+/3

assertEquals '6' "$(evaluate '/tmp/nested_sum/+')"
