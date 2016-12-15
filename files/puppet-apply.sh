#!/bin/bash -e

puppet apply --modulepath=/puppet-modules "$@"
