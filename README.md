# How to use

## 下ごしらえ
### 1.APIモードでRails new
#### 1.1.Gemfileを設置
```
mkdir api && cd api
お好みのGemfileを設置
```

#### 1.2.Rails new
```
bundle exec rails new . -d mysql -f --api -BGSJT --skip-gemfile --skip-coffee --skip-turbolinks --skip-system-test
```

##### オプションについて
- -d mysql
  - MySQLを使用する
- -f
  - 既存ファイル上書きする
- --api
  - APIモードでプロジェクト生成
- -BGSJT
  - bundle installを実行しない
  - .gitignoreを生成しない
  - Sprocketsを無効
  - JavaScriptを組み込まない
  - テストを組み込まない
- --skip-gemfile
  - Gemfileを生成しない
- --skip-coffee
  - CoffeeScriptを使用しない
- --skip-turbolinks
  - turbolinksを無効
- --skip-system-test
  - system testを無効

## 0.前提条件
- minikubeがインストール、起動されていること

## 1.minikubeのbuiltin Docker daemonを利用可能にする
- ターミナル上で `eval $(minikube docker-env)`
  - やめるときは `eval "$(docker-machine env -u)"`

## 2.ローカルのコンテナをminikube上にビルドする
1. Dockerfileがある場所に移動
2. `docker build -t {コンテナ名}:{タグ} .` を実行

## 3.Kubernetes上に反映する
1. 各種ymlを作る
2. ymlがあるディレクトリに移動
2. `kubectl apply -f .` で全部反映する
