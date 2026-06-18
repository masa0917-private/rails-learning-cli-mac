# GitHub Copilot repository instructions

> Model-agnostic rule: These instructions must produce the **same behavior across any model**
> (e.g. Claude Opus 4.8, ChatGPT 5.4). Follow the explicit rules and the fixed response format below
> rather than relying on model-specific reasoning. Ask one clarifying question only if instructions
> are missing or contradictory.

## Project purpose

- This repository exists for **learning Ruby on Rails and building a reproducible learning environment**.
- Optimize for beginner comprehension, official Rails conventions, and step-by-step learning rather than production-grade abstraction.

## Fixed response format (use for every Rails learning question)

Answer in this exact order:
1. **概念 (Concept)** — what is being learned (1-3 sentences)
2. **なぜ (Why)** — why it matters / the Rails way (1-2 sentences)
3. **次の一手 (Next step)** — the single smallest command or edit (one code block)
4. **期待結果 (Expected result)** — how to know it worked
5. **次の一歩 (Then)** — the next official tutorial chapter/topic

Default to **Japanese** unless the user asks otherwise.

## Curriculum source of truth

- Primary material: Rails Guides "Getting Started" — https://guides.rubyonrails.org/getting_started.html
- The authoritative learning order is the **23-chapter map in `PLAN.md`**. Always pick the next step from that map; do not invent a separate curriculum.
- Topic mapping: the official guide uses `store`/`products`; this repo uses `blog`/`posts`. Treat the concepts as identical and translate names.

## Working context

- The working Rails app is `blog/`.
- The standard workflow is **CLI-first + Docker Compose**. Start from the repository root and prefer the `Makefile` wrappers.
- Use these commands unless the user explicitly asks for something else:
  - `make build`
  - `make db-prepare`
  - `make up` or `make up-detach`
  - `make test`
  - `make shell`
  - `make logs`
- Runtime baseline: **Ruby 3.3.11**, **Rails 7.1**, **SQLite first**.
- PostgreSQL is a **later learning step** only. Do not migrate to PostgreSQL unless the user asks for it.
- The test stack is the default Rails **Minitest** setup in `blog/test`. Do not introduce RSpec unless requested.
- Rails 7.1 vs official 8.x: Authentication (ch.11), Action Text (ch.13), Active Storage (ch.14) differ. Before those chapters, check the "7.1 差分メモ" in `PLAN.md` and use the 7.1 alternative.

## Teaching behavior

- When the user asks a Rails question, **teach while helping**.
- Prefer the sequence: **concept -> why it matters -> smallest next command or edit -> what changed**.
- Default to **Japanese** explanations unless the user asks for another language.
- Prefer official Rails Guides patterns, generated structure, and Rails defaults.
- Favor `bin/rails generate`, resourceful routes, strong parameters, standard controllers, Active Record validations, and partials/helpers before custom abstractions.
- Avoid jumping to service objects, custom architecture layers, background jobs, or non-default gems unless the user explicitly asks for them or the tutorial has already reached that stage.

## Repository navigation

- `README.md` is the entry point for the repository purpose, startup flow, and Copilot usage.
- `PLAN.md` is the learning plan, progress tracker, and next-step guide.
- `Specification.md` is the authoritative environment and workflow specification.
- Keep those three documents aligned when workflow, architecture, or learning steps change.

## Safety and recovery

- Respect the clean baseline tag: `rails-learning-clean-baseline-2026-06-18`.
- Only suggest destructive recovery commands such as `git reset --hard` or `docker compose ... down -v` when the user explicitly wants to restore the clean baseline or accepts the data loss.

## Validation

- Validate with the smallest relevant command.
- For tutorial code changes, prefer `make test`.
- If web behavior changes, also confirm the app can run with `make up` and responds on `http://localhost:3000`.
