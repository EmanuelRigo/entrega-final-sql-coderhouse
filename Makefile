include .env

SERVICE_NAME=mysql
HOST=127.0.0.1
PORT=3306

PASSWORD=${MYSQL_ROOT_PASSWORD}
DATABASE=${MYSQL_DATABASE}
USER=${MYSQL_USER}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./sql_project/database_structure.sql
STORED_PROCEDURES=./sql_project/database_objects/store_procedures.sql
TRIGGERS=./sql_project/database_objects/triggers.sql
VIEWS=./sql_project/database_objects/views.sql
FUNCTIONS=./sql_project/database_objects/functions.sql
DATABASE_POPULATION=./sql_project/population.sql
USER_ROLES=./sql_project/database_objects/user_roles.sql

.PHONY: all up create-db objects populate roles test-db access-db down

all: info up create-db objects populate roles

info:
	@echo "This is a project for $(DATABASE)"
	@echo "Using service $(SERVICE_NAME) on host $(HOST) and port $(PORT)"
	@echo "User: $(USER)"

up:
	@echo "Creating Docker instance..."
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build

	@echo "Waiting for MySQL to be ready..."
	bash mysql_wait.sh

create-db:
	@echo "Importing database structure..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source $(DATABASE_CREATION);"

objects: 
	@echo "Creating stored procedures..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source $(STORED_PROCEDURES);"

	@echo "Creating triggers..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source $(TRIGGERS);"

	@echo "Creating views..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source $(VIEWS);"

	@echo "Creating functions..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source $(FUNCTIONS);"

populate:
	@echo "Populating database..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) --local-infile=1 -e "source $(DATABASE_POPULATION);"

roles:
	@echo "Applying user roles..."
	docker exec -it $(SERVICE_NAME) mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source $(USER_ROLES);"

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
