DEFAULT_HELP_MESSAGE="Help command is not set up"

help:
	echo ${DEFAULT_HELP_MESSAGE}


# DOCKER TASKS

up: 
	docker-compose up

up-build: 
	docker-compose up --build

stop: 
	docker-compose stop

down: 
	docker-compose down
