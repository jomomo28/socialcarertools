# Comandos básicos
up:
	docker compose up

down:
	docker compose down

build:
	docker compose build

restart: down up

logs:
	docker compose logs -f

# Servicios individuales
front:
	docker compose up front

frontbackend:
	docker compose up frontbackend

backend:
	docker compose up backend

# Limpiar contenedores huérfanos
clean:
	docker compose down --remove-orphans

# Ejecutar comandos útiles dentro de los servicios
install_front:
	docker compose run --rm frontend npm install

install_backend:
	docker compose run --rm frontbackend npm install

# Rebuild forzado (sin cache)
rebuild:
	docker compose build --no-cache
