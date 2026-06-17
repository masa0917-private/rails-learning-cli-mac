# Makefile - convenience targets for CLI-first Rails + Docker Compose

.PHONY: help build buildx up up-detach down rebuild db-prepare console test shell ps rake

build:
	docker compose build

# Build multi-arch image (useful on Apple Silicon)
buildx:
	docker buildx create --use --name rbx || true
	docker buildx build --platform linux/arm64,linux/amd64 --load -t rails-blog:dev .

up:
	docker compose up

up-detach:
	docker compose up -d

down:
	docker compose down

rebuild:
	docker compose up --build

db-prepare:
	docker compose run --rm web ./bin/rails db:prepare

console:
	docker compose run --rm web ./bin/rails console

test:
	docker compose run --rm web ./bin/rails test

rake:
	docker compose run --rm web bundle exec rake

shell:
	docker compose exec web bash

help:
	@echo "Available targets:"
	@echo "  help        - Show this help"
	@echo "  build       - docker compose build"
	@echo "  buildx      - buildx multi-arch image (Apple Silicon)"
	@echo "  up          - docker compose up"
	@echo "  up-detach   - docker compose up -d"
	@echo "  down        - docker compose down"
	@echo "  rebuild     - docker compose up --build"
	@echo "  db-prepare  - docker compose run --rm web ./bin/rails db:prepare"
	@echo "  console     - docker compose run --rm web ./bin/rails console"
	@echo "  test        - docker compose run --rm web ./bin/rails test"
	@echo "  shell       - docker compose exec web bash"
	@echo "  ps          - docker compose ps"

ps:
	docker compose ps
