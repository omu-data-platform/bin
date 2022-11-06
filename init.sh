#!/bin/sh

function init() {
    compose_file="./$1/docker-compose.yml"
    docker-compose -f $compose_file exec $2
}

mds_path="masterdatastore"
init_file="/root/init.sh"  # コンテナ内にコピーしたinit.sh
init $mds_path $init_file
