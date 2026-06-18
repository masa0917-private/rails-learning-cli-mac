# RECOVERY.md — 中断・スリープ・再起動からの復帰手順（エージェント非依存）

このリポジトリで学習中に起こりうる「中断」への対応をまとめた**ランブック**です。
どのエージェント（Claude Opus 4.8 / ChatGPT 5.4 など）でも、この手順をそのまま実行すれば学習を再開できます。

---

## 0. 大前提（なぜディレクトリが重要か）

- Copilot CLI は **起動したディレクトリのリポジトリルート**から、`AGENTS.md` と `.github/copilot-instructions.md` を自動読込します。
- そのため **必ず `~/Documents/Rails` で `copilot` を起動**すれば、Rails 家庭教師ペルソナが自動で適用されます。
- 学習の進捗は `PROGRESS.md`、学習順序は `PLAN.md` に記録されているため、セッションが変わっても継続できます。

---

## 1. 学習を一時中断したいとき（自分から止める）

1. 必要なら学習者かエージェントが `PROGRESS.md` の「現在の章 / 次の一手」を更新。
2. 変更があれば commit:
   ```bash
   cd ~/Documents/Rails
   git add -A && git commit -m "学習途中の状態を保存"
   ```
3. Copilot を終了: 対話中に `Ctrl-C` を2回、または `/exit`。
4. アプリは動かしたままで良い（`make up-detach` 状態なら起動継続）。止めたい場合は `make down`。

---

## 2. Copilot を一旦終了し、後で同じ会話を再開したいとき

```bash
cd ~/Documents/Rails        # 必ずリポジトリルート
copilot --continue          # 直近のセッションを再開
# もしくはセッションを選んで再開
copilot --resume
```

- `--continue`: 直近セッションをそのまま再開。
- `--resume`: セッション選択メニューから再開。
- どちらも `~/Documents/Rails` で起動すれば、ペルソナ（AGENTS.md）は自動適用される。
- 新しい会話で始めても良い（その場合は `copilot` のみ）。`PROGRESS.md` を読めば続きが分かる。

---

## 3. OS が突然スリープした / スリープから復帰したとき

- 多くの場合、スリープ復帰後もコンテナは自動で動作を再開します（`restart: unless-stopped` 設定済み）。
- 念のため確認:
  ```bash
  cd ~/Documents/Rails
  make ps                                   # web が Up か確認
  curl -s -o /dev/null -w '%{http_code}\n' http://localhost:3000   # 200 を期待
  ```
- 応答しない場合は再起動:
  ```bash
  make up-detach
  ```

---

## 4. Mac を再起動した / Docker Desktop が落ちたとき

1. **Docker Desktop を起動**（メニューバーのクジラが安定するまで待つ）。
2. アプリを再開:
   ```bash
   cd ~/Documents/Rails
   make up-detach
   curl -s -o /dev/null -w '%{http_code}\n' http://localhost:3000   # 200 を期待
   ```
   - `restart: unless-stopped` のため、Docker 起動時に自動再開されることも多い。その場合 `make ps` で Up を確認するだけで良い。
3. 学習を再開:
   ```bash
   copilot --continue
   ```

---

## 5. 復帰後の標準チェック（迷ったらこれ）

```bash
cd ~/Documents/Rails
git status -sb                              # 作業ツリーの状態
make ps                                     # コンテナ状態
make up-detach                              # 起動（既に Up なら何もしない）
curl -s -o /dev/null -w '%{http_code}\n' http://localhost:3000   # 200 を期待
cat PROGRESS.md                             # 続きの確認
copilot --continue                          # 学習再開
```

または1コマンドで:
```bash
cd ~/Documents/Rails && make resume
```

---

## 6. 環境が壊れたとき（最終手段・破壊的）

クリーン基準点へ戻す（未コミット変更と学習データは失われる）:
```bash
cd ~/Documents/Rails
git fetch --tags
git reset --hard rails-learning-clean-baseline-2026-06-18
docker compose -f blog/compose.yaml down -v
docker compose -f blog/compose.yaml up --build -d
docker compose -f blog/compose.yaml run --rm web ./bin/rails db:prepare
```

> 注意: この操作は学習の進捗（コミットしていない変更）も消えます。最後の手段としてのみ使用。

---

## まとめ（最短の合言葉）

> **「ターミナルを開く → `cd ~/Documents/Rails` → `make resume` → `copilot --continue`」**

この4ステップで、どんな中断からでも、専用の Rails 家庭教師のもとで学習を再開できます。
