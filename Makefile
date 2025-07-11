up: up_backend up_middleware up_front

down:
	docker compose down

build:
	docker compose build

restart: down up

logs:
	docker compose logs -f

up_front:
	docker compose up -d frontend

up_middleware:
	docker compose up -d middleware

up_backend:
	docker compose up -d backend

clean:
	docker compose down --remove-orphans

rebuild:
	docker compose build --no-cache
