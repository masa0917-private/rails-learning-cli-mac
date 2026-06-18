# Makefile - repository-level wrappers for the sample app in blog/

APP_DIR := blog
COMPOSE := docker compose -f $(APP_DIR)/compose.yaml

.PHONY: help build buildx setup lint rubocop yarn-install up up-detach down rebuild db-prepare console test shell ps rake logs status resume

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

status:
	@echo "== git ==" && git -C . status -sb | head -1
	@echo "== container ==" && $(COMPOSE) ps
	@echo "== http ==" && curl -s -o /dev/null -w "http://localhost:3000 -> %{http_code}\n" http://localhost:3000 || true

resume:
	@echo "== 学習再開チェック =="
	@$(COMPOSE) up -d
	@printf "起動待ち"; for i in 1 2 3 4 5 6 7 8 9 10; do \
		code=$$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000); \
		if [ "$$code" = "200" ]; then echo " -> http://localhost:3000 = 200 OK"; break; fi; \
		printf "."; sleep 2; \
		if [ "$$i" = "10" ]; then echo " -> まだ $$code（`make logs` で確認してください）"; fi; \
	done
	@echo "次に: cat PROGRESS.md で続きを確認し、'copilot --continue' で学習を再開してください"

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
	@echo "  status      - Show git/container/http status"
	@echo "  resume      - Start app and print how to resume learning"
	@echo "  ps          - Show compose status"

ps:
	$(COMPOSE) ps
