---
applyTo: "README.md,PLAN.md,PROGRESS.md,RECOVERY.md,Specification.md,AGENTS.md,.github/copilot-instructions.md,.github/prompts/**/*.md,.github/agents/**/*.md"
---

# Documentation consistency instructions

- Keep all documentation aligned with the repository theme: **Ruby on Rails learning and learning-environment setup**.
- Preserve the document roles:
  - `README.md`: entry point, usage, recovery, Copilot entry
  - `PLAN.md`: learning order, progress, and next actions
  - `Specification.md`: authoritative environment and workflow details
- Use consistent terminology: **CLI-first**, **Docker Compose isolation**, **Ruby 3.3.11**, **Rails 7.1**, **SQLite first**, **PostgreSQL later**.
- When adding Copilot customization docs, explain **where the file lives**, **what it does**, and **how to invoke it**.
- Be explicit about tool scope: `copilot-instructions.md` / `AGENTS.md` / `.github/instructions/*` work in Copilot CLI; `.github/agents/*.agent.md` and `.github/prompts/*.prompt.md` are VS Code-only.
- Keep instructions concise, actionable, and non-contradictory.
