# Makefile - repository-level wrappers for the sample app in blog/

APP_DIR := blog
COMPOSE := docker compose -f $(APP_DIR)/compose.yaml

.PHONY: help build buildx setup lint rubocop yarn-install up up-detach down rebuild db-prepare console test shell ps rake logs

build:
	$(COMPOSE) build

# Build multi-arch image for the sample app (useful on Apple Silicon)
buildx:
	docker buildx create --use --name rbx || true
	docker buildx build --platform linux/arm64,linux/amd64 --load -t blog-web:dev -f $(APP_DIR)/Dockerfile.dev $(APP_DIR)

setup:
	$(COMPOSE) run --rm web bundle install

lint:
	$(COMPOSE) run --rm web bundle exec rubocop

rubocop: lint

yarn-install:
	$(COMPOSE) run --rm web yarn install

up:
	$(COMPOSE) up

up-detach:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

rebuild:
	$(COMPOSE) up --build

db-prepare:
	$(COMPOSE) run --rm web ./bin/rails db:prepare

console:
	$(COMPOSE) run --rm web ./bin/rails console

test:
	$(COMPOSE) run --rm web ./bin/rails test

rake:
	$(COMPOSE) run --rm web bundle exec rake

shell:
	$(COMPOSE) exec web bash

logs:
	$(COMPOSE) logs --no-color --tail=200

help:
	@echo "Available targets:"
	@echo "  help        - Show this help"
	@echo "  build       - Build the sample app image in blog/"
	@echo "  buildx      - Multi-arch build for blog/ (Apple Silicon)"
	@echo "  setup       - bundle install inside the blog container"
	@echo "  lint        - Run rubocop inside the blog container"
	@echo "  up          - Start the sample app"
	@echo "  up-detach   - Start the sample app in background"
	@echo "  down        - Stop the sample app"
	@echo "  rebuild     - Rebuild and start the sample app"
	@echo "  db-prepare  - Run rails db:prepare for blog/"
	@echo "  console     - Open rails console for blog/"
	@echo "  test        - Run rails test for blog/"
	@echo "  shell       - Open a shell in the running blog container"
	@echo "  logs        - Show recent container logs"
	@echo "  ps          - Show compose status"

ps:
	$(COMPOSE) ps
