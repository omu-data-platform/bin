#!/bin/sh

set -eu

cd $(dirname $0)

# git pullして、ローカルのプログラムを、リモートリポジトリのプログラムに更新する
function gt_pull() {
    git pull origin main
}

mds="masterdatastore"
(cd $mds && gt_pull)
adm="admin"
(cd $adm && gt_pull)
web="web"
(cd $web && gt_pull)
