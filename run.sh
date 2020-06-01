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

case $1 in
    "all")
        ${KUBE_BENCH} run --benchmark cis-1.5 --unscored=false             \
                          --targets master,node,controlplane,etcd,policies \
                          --config=config.yaml                             \
                          --config-dir=./
    ;;
    "master")
        ${KUBE_BENCH} run --benchmark cis-1.5 --unscored=false             \
                          --targets master                                 \
                          --config=config.yaml                             \
                          --config-dir=./
    ;;
    "node")
        ${KUBE_BENCH} run --benchmark cis-1.5 --unscored=false             \
                          --targets node                                   \
                          --config=config.yaml                             \
                          --config-dir=./
    ;;
    "controlplane")
        ${KUBE_BENCH} run --benchmark cis-1.5 --unscored=false             \
                          --targets controlplane                           \
                          --config=config.yaml                             \
                          --config-dir=./
    ;;
    "etcd")
        ${KUBE_BENCH} run --benchmark cis-1.5 --unscored=false             \
                          --targets etcd                                   \
                          --config=config.yaml                             \
                          --config-dir=./
    ;;
    "policies")
        ${KUBE_BENCH} run --benchmark cis-1.5 --unscored=false             \
                          --targets policies                               \
                          --config=config.yaml                             \
                          --config-dir=./
    ;;
    *)
        echo "error: argument required [all|node|master|policies|etcd]"
        exit 1
    ;;
esac

exit 0

