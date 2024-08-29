include .env

SERVICE_NAME=mysql
HOST=127.0.0.1
PORT=3306

PASSWORD=${MYSQL_ROOT_PASSWORD}
DATABASE=${MYSQL_DATABASE}
USER=${MYSQL_USER}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./sql_project/database_structure.sql
DATABASE_POPULATION=./sql_project/population.sql

FILES=vistas funciones triggers stored_procedures user_roles

.PHONY: all up objects test-db access-db down

all: info up objects

info:
	@echo "This is a project for $(DATABASE)"
	@echo "Using service $(SERVICE_NAME) on host $(HOST) and port $(PORT)"
	@echo "User: $(USER)"

up:
	@echo "Creating Docker instance..."
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build

	@echo "Waiting for MySQL to be ready..."
	bash mysql_wait.sh

	@echo "Importing database structure..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source $(DATABASE_CREATION);"

	@echo "Creating objects in database..."
	@for file in $(FILES); do \
		echo "Processing $$file and adding to the database: $(DATABASE)"; \
		docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source ./sql_project/database_objects/$$file.sql"; \
	done

	@echo "Populating database..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) --local-infile=1 -e "source $(DATABASE_POPULATION);"

objects:
	@echo "Creating objects in database..."
	@for file in $(FILES); do \
		echo "Processing $$file and adding to the database: $(DATABASE)"; \
		docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source ./sql_project/database_objects/$$file.sql"; \
	done

test-db:
	@echo "Testing the tables..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source ./sql_project/check_db_objects.sql";

access-db:
	@echo "Accessing the DB client..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD)

down:
	@echo "Removing the database..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) --host $(HOST) --port $(PORT) -e "DROP DATABASE IF EXISTS $(DATABASE);"
	@echo "Stopping Docker containers..."
	docker compose -f $(DOCKER_COMPOSE_FILE) down
	@echo "Done."
