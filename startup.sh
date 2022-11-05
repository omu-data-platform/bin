#!/bin/sh


# ディレクトリが存在しなければ、git cloneする
# そのあと、biuldしてup
function dc_build_up() {
    if [ ! -e ./$1 ]; then
        git clone git@github.com:omu-data-platform/$1.git
    fi
    compose_file="./$1/docker-compose.yml"
    docker-compose -f $compose_file build
    docker-compose -f $compose_file up -d
    echo ""
}


mds_path="masterdatastore"
dc_build_up $mds_path
web_path="web"
dc_build_up $web_path
