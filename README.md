# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

以下のコマンドは、レクチャー内で実行しているコマンドです。
docker-compose.ymlファイルの置いてあるディレクトリで実行してください。
※ドルマークは、コマンドに含めないでください。

# Railsのコンテナを起動してRailsのプロジェクトを作成するコマンド
$ docker-compose run web rails new . --force --database=postgres

# Railsイメージのビルド実行コマンド
$ docker-compose build

# config/database.ymlの修正内容
# default内の項目を修正
password: password
host: db

# コンテナをデタッチドモード（バックグラウンド）で実行するコマンド
$ docker-compose up -d

# RailsのコンテナでDB作成のタスクを実行するコマンド
$ docker-compose run web bundle exec rails db:create

# docker-compose up -d後
$ docker-compose.exe run web bundle exec rails db:creat
$ docker-compose.exe run web bundle exec rails db:migrate