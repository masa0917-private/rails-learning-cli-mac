---
applyTo: "blog/**/*.rb,blog/config/routes.rb,blog/config/**/*.yml,blog/db/**/*.rb,blog/test/**/*.rb,blog/Gemfile"
---

# Rails tutorial code instructions

- Follow the **23-chapter learning map in `PLAN.md`** (official "Getting Started" order). Do not invent a separate curriculum.
- Topic mapping: the official guide uses `store`/`products`; this repo uses `blog`/`posts`. Treat concepts as identical and translate names.
- Keep the code **recognizable to a beginner following the official Rails Guides**.
- Prefer the default Rails directory structure and generated patterns over custom abstractions.
- Use **RESTful routes** and standard controller actions unless the tutorial step requires something else.
- Use **strong parameters** in controllers.
- Add only the **smallest necessary validations, associations, and migrations** for the lesson being taught.
- Preserve compatibility with the current stack: **Rails 7.1**, **Ruby 3.3.11**, **SQLite**, **Minitest**, **Docker Compose**.
- For chapters that differ between Rails 7.1 and official 8.x (Authentication ch.11, Action Text ch.13, Active Storage ch.14), use the 7.1 alternative noted in `PLAN.md`.
- Prefer `bin/rails generate`-style changes and Rails defaults before manual scaffolding.
- Do not introduce RSpec, PostgreSQL, Sidekiq, Redis, authentication gems, or service objects unless the user explicitly asks for them.
- If comments are needed, keep them short and educational, only for Rails behavior that is non-obvious to a learner.
