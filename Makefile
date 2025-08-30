up: up_otel_collector up_backend up_middleware up_front up_grafana 

down:
	docker compose down

down_front:
	docker compose down -d frontend

down_middleware:
	docker compose down -d middleware

down_backend:
	docker compose down -d backend

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

up_grafana:
	docker compose up -d grafana

up_otel_collector:
	docker compose up -d otel-collector

clean:
	docker compose down --remove-orphans

rebuild:
	docker compose build --no-cache
