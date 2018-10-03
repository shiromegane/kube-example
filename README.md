# Docker image
## API (Rails)
### 1.下準備
1. `mkdir api && cd api`
2. お好みのGemfileを配置
3. プロジェクト作成
```
bundle exec rails new . -d mysql -f --api -BGSJT --skip-gemfile --skip-coffee --skip-turbolinks --skip-system-test
```
#### オプションについて
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

# minikube
## minikubeにローカルDocker imageをビルド
### 1.minikubeのbuiltin Docker daemonを利用可能にする
- ターミナル上で `eval $(minikube docker-env)`
  - やめるときは `eval "$(docker-machine env -u)"`

### 2.ローカルのコンテナをminikube上にビルドする
1. Dockerfileがある場所に移動
2. `docker build -t {コンテナ名}:{タグ} .` を実行

# Kubernetes
## namespaceを作る
- `kubectl create namespace example-app`

## 各種設定ymlを作る
- `.kubernetes/` 配下参照

## 各種設定を反映する
1. ymlがあるディレクトリに移動
2. `kubectl apply -f .`

## 永続ボリューム
### 1.NFSボリューム用ディレクトリをホストOSに用意する
1. `sudo mkdir /kube-pv`
2. `sudo chmod 777 /kube-pv`
3. `sudo vi /etc/exports`
```bash
/kube-pv -mapall=nobody:wheel -network 192.168.99.0 -mask 255.255.255.0
```
### 2.ホストOSのNFSデーモン起動
1. `sudo nfsd start`
2. `sudo nfsd update`
3. `sudo showmount -e` で確認
### 3.minikubeからマウントする
1. `minikube ssh`
2. `sudo mkdir /pv`
3. `sudo mount -t nfs 192.168.99.1:/kube-pv /pv`
### 4.PersistentVolumeを作る
1. PersistentVolumeの設定ymlを作る
    - `.kubernetes/nfs-pv.yml` 参照
2. `kubectl create -f nfs-pv.yml` で反映
### 5.PersistentVolumeClaimを作る
1. PersistentVolumeClaimの設定ymlを作る
    - `.kubernetes/nfs-pvc.yml` 参照
2. `kubectl create -f nfs-pvc.yml` で反映
