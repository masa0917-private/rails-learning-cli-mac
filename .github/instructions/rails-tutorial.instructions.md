---
applyTo: "blog/**/*.rb,blog/config/routes.rb,blog/config/**/*.yml,blog/db/**/*.rb,blog/test/**/*.rb,blog/Gemfile"
---

# Rails tutorial code instructions

- Keep the code **recognizable to a beginner following the official Rails Guides**.
- Prefer the default Rails directory structure and generated patterns over custom abstractions.
- Use **RESTful routes** and standard controller actions unless the tutorial step requires something else.
- Use **strong parameters** in controllers.
- Add only the **smallest necessary validations, associations, and migrations** for the lesson being taught.
- Preserve compatibility with the current stack: **Rails 7.1**, **Ruby 3.3.11**, **SQLite**, **Minitest**, **Docker Compose**.
- Prefer `bin/rails generate`-style changes and Rails defaults before manual scaffolding.
- Do not introduce RSpec, PostgreSQL, Sidekiq, Redis, authentication gems, or service objects unless the user explicitly asks for them.
- If comments are needed, keep them short and educational, only for Rails behavior that is non-obvious to a learner.
