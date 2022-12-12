#!/bin/sh


# ディレクトリが存在しなければ、git cloneする
function gt_clone() {
    if [ ! -e ./$1 ]; then
        git clone git@github.com:omu-data-platform/$1.git
    fi
}

# docker-compose の biuld と up
function dc_build_up() {
    compose_file="./$1/docker-compose.yml"
    docker-compose -f $compose_file build
    docker-compose -f $compose_file up -d
    echo ""
}


mds_path="masterdatastore"
gt_clone $mds_path
dc_build_up $mds_path
web_path="web"
gt_clone $web_path
dc_build_up $web_path
