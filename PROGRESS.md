# PROGRESS.md — 学習の進捗トラッカー（中断・復帰の基準）

> このファイルは「どこまで学んだか」「次に何をするか」を記録する**単一の真実**です。
> Copilot（どのモデルでも）はセッション開始時にこのファイルを読み、ここから学習を再開します。
> 章を進めるたび、エージェントまたは学習者がこのファイルを更新します。

## 現在地

- 現在の章: **第5章 Creating a Database Model（未着手）**
- 直近に完了したこと: 環境構築・ドキュメント整備・Copilot 最適化（学習本体は未開始）
- 次の一手: `make shell` で `bin/rails generate model Post title:string body:text` を実行する
- 主教材リンク: https://guides.rubyonrails.org/getting_started.html
- 学習順序の正本: `PLAN.md` の「学習計画（公式 Getting Started 準拠 / 全23章マップ）」

## 章チェックリスト（公式23章マップ）

- [x] 1 Introduction
- [x] 2 Rails Philosophy
- [x] 3 Creating a New Rails App（`blog/` は生成済み）
- [x] 4 Hello, Rails!（`make up` で HTTP 200 確認済み）
- [ ] 5 Creating a Database Model
- [ ] 6 Rails Console
- [ ] 7 Active Record Model Basics
- [ ] 8 A Request's Journey Through Rails
- [ ] 9 Routes
- [ ] 10 Controllers & Actions
- [ ] 11 Adding Authentication（7.1差分あり / PLAN.md参照）
- [ ] 12 Caching
- [ ] 13 Action Text（7.1差分あり / PLAN.md参照）
- [ ] 14 Active Storage（7.1差分あり / PLAN.md参照）
- [ ] 15 Internationalization (I18n)
- [ ] 16 Action Mailer
- [ ] 17 Adding CSS & JavaScript
- [ ] 18 Testing
- [ ] 19 RuboCop
- [ ] 20 Security
- [ ] 21 CI with GitHub Actions（本リポジトリ CI 構築済み）
- [ ] 22 Deploying to Production
- [ ] 23 What's Next?

## 更新ルール（エージェント向け）

- 章を完了したらチェックを `[x]` にし、「現在の章」「直近に完了したこと」「次の一手」を更新する。
- 1セッションで複数章を進めた場合も、最後に必ずここを最新化する。
- 更新後は git commit を案内する（機密を含めない）。
