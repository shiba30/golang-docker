# web-service-gin

gin と mysql を使った簡単な web アプリケーションです。

## mysql

ホストで port 3306 で起動してください。

## 環境変数

mysql を使用するために以下の環境変数を設定してください

- DBUSER
- DBPASS

## database

- myapp で database を作成してください。

- sql ディレクトリ以下にテーブル作成と seed データ作成の sql ファイルを作成しているので実行してください

## docker

- 前提条件

  - Docker がインストールされていること
  - Docker Compose がインストールされていること

- 手順

  1. リポジトリの clone する

     ```
     git clone https://github.com/ihatov08/web-service-gin.git
     ```

  2. プロジェクトのディレクトリに移動

     ```
     cd web-service-gin
     ```

  3. Docker Compose でアプリと DB を起動

     ```
     docker-compose up
     ```

  4. ブラウザからアプリにアクセス

     ```
     http://localhost:8080/albums
     ```
