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

backend_shell:
	docker compose exec backend /bin/bash

postman:
	docker compose run --rm newman run /etc/newman/social-carer.postman_collection.json -e /etc/newman/local.postman_environment.json

test_backend:
	docker compose run --rm -e OTEL_SDK_DISABLED=true backend pytest tests --cov=src --cov-report=xml:/app/reports/coverage.xml

static_analysis: static_analysis_frontend static_analysis_middleware test_backend static_analysis_backend

static_analysis_frontend:
	docker compose run --rm sonar-scanner -Dproject.settings=/app/frontend/sonar-project-front.properties

static_analysis_middleware:
	docker compose run --rm sonar-scanner -Dproject.settings=/app/middleware/sonar-project-middleware.properties

static_analysis_backend:
	docker compose run --rm sonar-scanner -Dproject.settings=/app/sonar-project.properties

down_sonar:
	docker compose down -d sonarqube db_sonar

up_sonar:
	docker compose up -d sonarqube db_sonar

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
