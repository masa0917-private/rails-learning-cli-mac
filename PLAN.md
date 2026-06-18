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

## チュートリアル開始前の残タスク
必須（ブロッカー）:
- [x] SSH（git@github.com）へ移行し push 疎通を確認（鍵 MBPro を登録）
- [x] ローカルからPATを除去（.git/config / osxkeychain）
- [x] 再構成した CI が green（実テスト実行構成、Gemfile.lock に x86_64-linux 追加で解消）
- [ ] 露出した PAT を GitHub で失効（revoke）: https://github.com/settings/tokens

確認済み（環境は準備完了）:
- [x] `make build` / `db:prepare` 済み、`make up` で HTTP 200 応答
- [x] `rails test` がコンテナ内で実行可能（現状 0 tests）

チュートリアル運用準備（任意・推奨）:
- [ ] Copilot CLI を待機状態にする運用を決める（別タブ/別ウィンドウ or tmux、/autopilot off）
- [ ] チュートリアル教材を Getting Started に確定: https://guides.rubyonrails.org/getting_started.html

## 次のアクション
- Rails Guides: Getting Started を blog/ 上で実施（最初の Article モデル作成から）
- 主要チェックポイント（`make up`、`make db-prepare`、`make test`）を通過する
- CI の安定運用（週次 run でのチェック）

## 運用ノート
- Apple Silicon 上は buildx や platform 指定が役に立つ
- ネイティブ gem は Dockerfile.dev に dev パッケージを追加しておく
- blog/ を保持して学習サンプルとするか、別リポジトリへ切り出すかは運用方針により検討
