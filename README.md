# Rails (CLI + Docker Compose) 学習リポジトリ

このリポジトリは「CLI中心・Docker Composeで隔離されたRails学習環境」を目的としたテンプレート／仕様です。

Prerequisites
- Docker Desktop（macOSの場合は Apple Silicon/Intel に対応）
- docker compose（Docker Desktop に同梱）
- `rails-new` で初期アプリを生成済み（例: `rails-new blog`）

素早い開始（Makefile を推奨）

# ビルド
make build

# 起動（フォアグラウンド）
make up

# 起動（デタッチ）
make up-detach

# DB準備
make db-prepare

# コンテナに入る
make shell

# テスト
make test

Apple Silicon (M1/M2) 注意
- 初回にマルチプラットフォームイメージが必要な場合は `make buildx` を使ってください。
- macOS では bind-mount の性能に注意。:delegated を使うと改善する場合があります。

参考: Specification.md を先に読み、手順に従ってください。