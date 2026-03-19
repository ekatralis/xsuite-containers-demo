#!/usr/bin/env bash

CONTAINER_FULLPATH="/cvmfs/unpacked.cern.ch/ghcr.io/ekatralis/xsuite-containers:latest-cuda12.8"
containerrun() {
  apptainer exec \
    --env PYTHONNOUSERSITE=1 \
    --home "$_CONDOR_SCRATCH_DIR" \
    --writable-tmpfs \
    --cleanenv \
    --nv \
    $CONTAINER_FULLPATH \
    "$@"
}

echo "Node info--------------------"
hostname -A
hostname -I
lscpu
echo "Env node info ---------------"

containerrun "$@"
