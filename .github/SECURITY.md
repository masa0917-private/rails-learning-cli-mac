# セキュリティポリシー / Security Policy

## このリポジトリについて / About this repository

これは **Ruby on Rails の学習** を目的とした **参照のみ可（view-only）** の
リポジトリです（[`LICENSE`](../LICENSE) / [`TERMS_OF_USE.md`](TERMS_OF_USE.md)）。
本番運用を想定したアプリケーションではありません。

This is a **view-only**, learning-purpose repository for Ruby on Rails. It is **not**
a production application.

## 脆弱性の報告 / Reporting a Vulnerability

学習用リポジトリのため、形式的なセキュリティ対応（パッチ提供・SLA 等）は
保証しません。ただし、明確な懸念がある場合は **GitHub の
Private vulnerability reporting**（Security タブ）または権利者への連絡で
**非公開に** お知らせください。

As a learning repository, no formal security response (patches, SLA) is guaranteed.
If you have a concern, please report it **privately** via GitHub's *Private
vulnerability reporting* (Security tab) or by contacting the owner:
https://github.com/masa0917-private

- 脆弱性内容を **公開 Issue に投稿しないで** ください。
- Please do **not** open a public issue for vulnerabilities.

## 機密情報 / Secrets

本リポジトリには秘密情報（トークン・鍵・パスワード等）を含めません。
万一混入を発見した場合は、上記の非公開チャネルで通知してください。

This repository must not contain secrets (tokens, keys, passwords). If you find any
accidentally committed, report it through the private channel above.

## フォーク・複製への免責 / No liability for forks and copies

権利者は、第三者が作成した本リポジトリの **フォーク・複製・ミラー・改変・派生物
（許可の有無を問わない）** について、一切の管理権を持たず、それらの内容・安全性・
利用に起因する請求・損害・責任を **一切負いません**。詳細は [`LICENSE`](../LICENSE)
の No Warranty / No Liability 条項を参照してください。

The copyright holder has no control over, and accepts **no responsibility or
liability** for, any fork, copy, mirror, modification, or derivative work of this
repository made by third parties (whether authorized or not), including their
content, security, or any use made of them. See the No Warranty / No Liability
sections of [`LICENSE`](../LICENSE).

## 多層防御メモ / Hardening Notes

- 依存関係の更新は Dependabot（[`.github/dependabot.yml`](dependabot.yml)）で監視。
- `.gitignore` で秘密・環境ファイル（`.env`, `config/master.key` など）を除外。
- 本リポジトリは学習用であり、ネットワーク公開サービスを想定していません。

- Dependency updates are monitored via Dependabot
  ([`.github/dependabot.yml`](dependabot.yml)).
- `.gitignore` excludes secret/env files (e.g. `.env`, `config/master.key`).
- This is a learning repository and is not intended as a network-exposed service.
