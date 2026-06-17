# Rails 学習プラン（要約）

## 目的
- Rails公式ドキュメントを主教材に、CLI + Docker Compose による隔離環境で学ぶ。
- ホストを汚さず、再現性の高い学習環境を維持する。

## 12 週間計画（要約）
1. Docker Compose と CLI の基礎（環境構築）
2. Ruby 基礎
3. Rails の哲学と MVC
4. Routing / Controller / View
5. Active Record / Migration / CRUD
6. Forms / Validation / Associations
7. Testing
8. 小アプリ中間完成（ブログ等）
9. Rails CLI 深掘り
10. Hotwire（Turbo）基礎
11. PostgreSQL 化（Compose で db service を追加）
12. 総仕上げ（コンテナ上で完成版アプリ）

## 現状（進捗）
- Specification.md、README、Makefile、CI ワークフローを整備
- サンプル app `blog/`（Rails 7.1 / Ruby 3.3.11 / SQLite）を生成・コミットし、Dockerfile.dev と compose.yaml を追加してローカルで起動済み（HTTP 200 確認）
- `blog/Gemfile.lock` を生成・コミット
- CI は `blog/` を作業ディレクトリとして Ruby 3.3.11 + SQLite で `db:prepare` と `rails test` を実行（実テストが走る構成）
- Makefile は `blog/compose.yaml` を対象に動作（`docker compose -f blog/compose.yaml ...`）

## 次のアクション
- Rails Guides: Getting Started を blog/ 上で実施
- 主要チェックポイント（`docker compose up`、`db:prepare`、`rails test`）を通過する
- CI の安定運用（週次 run でのチェック）

## 運用ノート
- Apple Silicon 上は buildx や platform 指定が役に立つ
- ネイティブ gem は Dockerfile.dev に dev パッケージを追加しておく
- blog/ を保持して学習サンプルとするか、別リポジトリへ切り出すかは運用方針により検討
