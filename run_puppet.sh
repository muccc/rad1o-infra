#!/bin/bash

puppet apply                          \
  --modulepath=$PWD/site:$PWD/modules \
  --hiera_config=$PWD/hiera.yaml      \
  site.pp
