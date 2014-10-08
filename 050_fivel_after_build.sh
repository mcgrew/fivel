#!/bin/bash

if [ -e www~ ]; then 
  rm -rf www
  mv www~ www
fi;
