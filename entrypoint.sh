#!/bin/bash

if [[ -v BANDWITH_LIMIT ]]; then
    tc qdisc add dev eth0 root tbf rate $BANDWITH_LIMIT latency 25ms burst 10k
fi


if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]] || [[ ! -x  $(command -v "$1") ]]; then
    exec /bin/clickhouse-backup "$@"
fi
exec "$@"
