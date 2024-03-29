# bin
各コマンドをシェルスクリプトにしたもの。

## ディレクトリツリーの例
```
omu-data-platform
├── admin
│   ├── README.md
│   ├── admindatabase
│   ├── adminserver
│   └── docker-compose.yml
├── bin
│   ├── README.md
│   ├── init.sh
│   ├── startup.sh
│   ├── stop.sh
│   └── update.sh
├── masterdatastore
│   ├── README.md
│   ├── apiserver
│   ├── docker-compose.yml
│   └── masterdatastore
├── web
│   ├── README.md
│   ├── docker-compose.yml
│   └── web
├── startup.sh -> ./bin/startup.sh
├── stop.sh -> ./bin/stop.sh
└── update.sh -> ./bin/update.sh
```

1. プロジェクトのファイルを作成し、このリポジトリ(bin)をクローンする。
1. シンボリックリンクでシェルスクリプトをプロジェクトディレクトリ直下におく。
1. 使用したいスクリプトをプロジェクトディレクトリ直下で実行。

## 各コマンド
### startup.sh
必要なプログラムをGitHubのリモートリポジトリからクローンし、立ち上げる。

(admin, masterdatastore, web)

### stop.sh
startup.shで立ち上げたプログラムを止める。

(admin, masterdatastore, web)

### update.sh
ローカルのプログラムを最新の状態に更新する。

(admin, masterdatastore, web)

## 使用例
初回。
```
$ cd [プロジェクトのディレクトリ]
$ git clone git@github.com:omu-data-platform/bin.git
$ ln -s ./bin/startup.sh
$ ln -s ./bin/stop.sh
$ ln -s ./update.sh
$ bash startup.sh
```

更新。
```
$ cd [プロジェクトのディレクトリ]
$ bash stop.sh
$ bash update.sh
$ bash startup.sh
```