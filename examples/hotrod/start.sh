#!/bin/bash

# export JAEGER_ENDPOINT=http://$HOST:9080/v1/trace
export JAEGER_ENDPOINT=http://10.92.49.140:9081/v1/trace

echo "Env variables"
printenv

exec "$@"
