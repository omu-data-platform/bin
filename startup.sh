#!/bin/sh

set -eu

cd $(dirname $0)

function confirm_dir() {
    echo -n "If the programs does not exist, save in `pwd`. Continue? [y/N]: "
    read ANS
    case $ANS in
        [Yy]* )
            echo "Startup."
            ;;
        * )
            exit 0
            ;;
    esac
}

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

confirm_dir

mds="masterdatastore"
gt_clone $mds
dc_build_up $mds
adm="admin"
gt_clone $adm
dc_build_up $adm
web="web"
gt_clone $web
dc_build_up $web
