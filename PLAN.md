# Rails 学習プラン

この文書のテーマは、**「目的：Ruby on Rails の学習と、学習のための環境構築」** です。
学習順序・進捗・次の行動を管理し、README.md と Specification.md の橋渡しを行います。

## ドキュメント内での役割

| ドキュメント | 役割 |
|---|---|
| `README.md` | 学習の入口、起動手順、復元手順 |
| `PLAN.md` | 学習プラン、進捗、次アクション |
| `Specification.md` | 環境構築と運用の正本 |

## 目的
- Rails公式ドキュメントを主教材に、CLI + Docker Compose による隔離環境で学ぶ。
- ホストを汚さず、再現性の高い学習環境を維持する。

## 学習計画（公式 Getting Started 準拠 / 全23章マップ）

主教材: Rails Guides「Getting Started」 https://guides.rubyonrails.org/getting_started.html
本リポジトリは Rails 7.1 / `blog`（題材は `posts`）。公式は Rails 8.1 / `store`（題材は `products`）。
**章の概念は同じ**なので、題材名の違いは読み替え、Rails 8.0+ 固有機能は「7.1での代替」を注記で進める。

| 週 | 公式章 | 本リポジトリでの進め方（blog/・CLI） | 7.1 差分メモ |
|---|---|---|---|
| 1 | 1 Introduction / 2 Rails Philosophy | Specification.md と README を読み、`make up` で起動確認 | 差分なし |
| 1 | 3 Creating a New Rails App / 4 Hello, Rails! | `blog/` は生成済み。`make db-prepare` → `make up` → HTTP 200 | `rails new` は記録のみ（再生成不要） |
| 2 | 5 Creating a Database Model | `bin/rails generate model` でモデル作成、migration 実行 | 差分なし |
| 2 | 6 Rails Console / 7 Active Record Model Basics | `make console` で CRUD を試す | 差分なし |
| 3 | 8 A Request's Journey / 9 Routes | `config/routes.rb` に resourceful routes を定義 | 差分なし |
| 3 | 10 Controllers & Actions | コントローラ/ビュー、strong parameters、CRUD 画面 | 差分なし |
| 4 | 11 Adding Authentication | 認証を学ぶ | **要注記**: 公式は Rails 8 認証ジェネレータ。7.1 は `has_secure_password` 等で代替 |
| 5 | 12 Caching | フラグメント/低レベルキャッシュ | 概ね同じ |
| 5 | 13 Action Text | リッチテキスト（`action_text` 導入） | gem 追加で対応可 |
| 6 | 14 Active Storage | ファイルアップロード | gem/設定で対応可 |
| 6 | 15 Internationalization (I18n) | ロケールファイルと翻訳 | 差分なし |
| 7 | 16 Action Mailer | メール送信（letter_opener 等で確認） | 差分なし |
| 7 | 17 Adding CSS & JavaScript | importmap / Hotwire（Turbo・Stimulus） | 7.1 も importmap+Hotwire 標準 |
| 8 | 18 Testing | Minitest（`make test`）で model/controller/system テスト | 差分なし |
| 8 | 19 RuboCop | `make lint`（rubocop）で整形・規約 | 差分なし |
| 9 | 20 Security | 脆弱性と対策（strong params, CSRF 等） | 差分なし |
| 9 | 21 CI with GitHub Actions | 本リポジトリ CI（`.github/workflows/ci.yml`）で実テスト | 既に構築済み |
| 10 | 22 Deploying to Production | Kamal 等のデプロイ概念を学ぶ（学習目的のため任意） | 環境次第で読み物中心 |
| 10 | 23 What's Next? | 次の学習トピックの確認 | 差分なし |
| 11 | 発展 | PostgreSQL 化（Specification.md 11章） | 任意・発展 |
| 12 | 仕上げ | 学んだ章を `blog/` 上で総復習・小機能追加 | — |

> 注: 「週」は目安（週5〜6時間想定）。公式章の順序を主、週配分を従とする。
> 認証(11)・Action Text(13)・Active Storage(14) は Rails 8 と 7.1 で手順差があるため、該当章に入る前に差分メモを確認する。

## 現状（進捗）
- Specification.md、README、Makefile、CI ワークフローを整備
- サンプル app `blog/`（Rails 7.1 / Ruby 3.3.11 / SQLite）を生成・コミットし、Dockerfile.dev と compose.yaml を追加してローカルで起動済み（HTTP 200 確認）
- `blog/Gemfile.lock` を生成・コミット
- CI は `blog/` を作業ディレクトリとして Ruby 3.3.11 + SQLite で `db:prepare` と `rails test` を実行（実テストが走る構成）
- Makefile は `blog/compose.yaml` を対象に動作（`docker compose -f blog/compose.yaml ...`）
- Copilot 最適化を追加（repo instructions / AGENTS.md / path-specific instructions / VS Code 用 `rails-tutor` agent・`/rails-tutorial` prompt）。CLI では `copilot-instructions.md` / `AGENTS.md` / `instructions/*` が有効、agent・prompt は VS Code 専用
- 学習計画を公式「Getting Started」全23章にマップ（A方針: 現環境 Rails 7.1/blog 維持、題材 store/products は読み替え、8.x 固有章は 7.1 差分メモで対応）
- Copilot 指示をモデル非依存化（固定応答フォーマット・章マップ参照・明示ルール）。ChatGPT 5.4 でも Claude Opus 4.8 と同等挙動を狙う

## チュートリアル開始前の残タスク
必須（ブロッカー）:
- [x] SSH（git@github.com）へ移行し push 疎通を確認（鍵 MBPro を登録）
- [x] ローカルからPATを除去（.git/config / osxkeychain）
- [x] 再構成した CI が green（実テスト実行構成、Gemfile.lock に x86_64-linux 追加で解消）
- [x] 露出した PAT を GitHub で失効（2本とも API 401 で失効確認済み）

確認済み（環境は準備完了）:
- [x] `make build` / `db:prepare` 済み、`make up` で HTTP 200 応答
- [x] `rails test` がコンテナ内で実行可能（現状 0 tests）

チュートリアル運用準備（任意・推奨）:
- [ ] Copilot CLI を待機状態にする運用を決める（別タブ/別ウィンドウ or tmux、/autopilot off）
- [ ] チュートリアル教材を Getting Started に確定: https://guides.rubyonrails.org/getting_started.html

## 次のアクション
- Rails Guides: Getting Started 第5章「Creating a Database Model」を `blog/` 上で実施（`bin/rails generate model` から）
- 各章ごとに主要チェックポイント（`make db-prepare`、`make up` で HTTP 200、`make test`）を通過する
- 章を終えるたびに git commit し、CI（実テスト）を green に保つ
- Copilot を使う場合: CLI は `AGENTS.md` / `copilot-instructions.md` が有効。VS Code は `rails-tutor` agent または `/rails-tutorial` prompt から開始する

## 運用ノート
- Apple Silicon 上は buildx や platform 指定が役に立つ
- ネイティブ gem は Dockerfile.dev に dev パッケージを追加しておく
- blog/ を保持して学習サンプルとするか、別リポジトリへ切り出すかは運用方針により検討
