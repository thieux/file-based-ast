#!/bin/bash

function assertEquals() {
  if [[ $1 = $2 ]]; then echo OK; else echo FAILURE; fi
}

assertEquals 1 1
assertEquals 1 2

