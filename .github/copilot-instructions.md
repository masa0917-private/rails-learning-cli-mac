# GitHub Copilot repository instructions

## Project purpose

- This repository exists for **learning Ruby on Rails and building a reproducible learning environment**.
- Optimize for beginner comprehension, official Rails conventions, and step-by-step learning rather than production-grade abstraction.

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
