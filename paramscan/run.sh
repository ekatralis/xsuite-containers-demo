#!/usr/bin/env bash

CONTAINER_FULLPATH="/cvmfs/unpacked.cern.ch/ghcr.io/ekatralis/xsuite-containers:latest"
echo $CONTAINER_FULLPATH
containerrun() {
  apptainer exec \
    --home "$_CONDOR_SCRATCH_DIR" \
    --writable-tmpfs \
    --cleanenv \
    $CONTAINER_FULLPATH \
    "$@"
}

lscpu
containerrun "$@"