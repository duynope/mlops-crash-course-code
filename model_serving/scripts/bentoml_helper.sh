#!/bin/bash

cmd=$1

usage() {
    echo "bentoml_helper.sh <command> [options]"
    echo "Available commands:"
    echo " serve          serve a bentoml service"
    echo "Available options:"
    echo " --port=x       bentoml service's port"
    echo " --reload       auto reload bentoml service"
}

if [[ -z "$cmd" ]]; then
    echo "Missing command"
    usage
    exit 1
fi

serve() {
    cd src
    export MLFLOW_TRACKING_URI=http://mlflow-mlflow-1:5000
    # In ra các tham số dòng lệnh đã truyền
    echo "Running bentoml serve with the following options: $@"
    bentoml serve bentoml_service:svc "$@"
}

shift

case $cmd in
serve)
    serve "$@"
    ;;
*)
    echo -n "Unknown command: $cmd"
    usage
    exit 1
    ;;
esac
