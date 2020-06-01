#!/bin/sh

set -e

if [ "${DEBUG}" = 1 ]; then
    set -x
fi

KUBE_BENCH=$(command -v kube-bench)
if [ -z ${KUBE_BENCH} ]; then
    echo "error: kube-bunch command not found"
    exit 1
fi

${KUBE_BENCH} run --benchmark cis-1.5 --unscored=false --nosummary \
                  --targets master,node,controlplane,etcd,policies \
                  --config=config.yaml                             \
                  --config-dir=./

exit 0

