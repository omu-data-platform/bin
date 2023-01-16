#!/bin/sh

cd $(dirname $0)

function dc_down() {
    compose_file="$1/docker-compose.yml"
    docker-compose -f $compose_file down
}

# down
web_path="./web"
dc_down $web_path
mds_path="./masterdatastore"
dc_down $mds_path
adm_path="./admin"
dc_down $adm_path