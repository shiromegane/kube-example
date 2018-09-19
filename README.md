# How to use

## 0.前提条件
- minikubeがインストール、起動されていること

## 1.minikubeのbuiltin Docker daemonを利用可能にする
- ターミナル上で `eval $(minikube docker-env)`
- やめるときは `eval "$(docker-machine env -u)"`

## 2.ローカルのコンテナをminikube上にビルドする
1. Dockerfileがある場所に移動
2. `docker build -t hogehoge:v1 .` を実行

