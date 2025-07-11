up: backend middleware front

down:
	docker compose down

build:
	docker compose build

restart: down up

logs:
	docker compose logs -f

front:
	docker compose up front

middleware:
	docker compose up middleware

backend:
	docker compose up backend

clean:
	docker compose down --remove-orphans

rebuild:
	docker compose build --no-cache
