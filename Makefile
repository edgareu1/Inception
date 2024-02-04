name = inception
env_path = /home/efreire-/.env

all:
	@printf "Launching configuration of ${name}\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file ${env_path} up -d

build:
	@printf "Building configuration of ${name}\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file ${env_path} up -d --build

down:
	@printf "Stopping configuration of ${name}\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file ${env_path} down

re: down
	@printf "Rebuild configuration of ${name}\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file ${env_path} up -d --build

clean: down
	@printf "Cleaning configuration of ${name}\n"
	@docker system prune -a
#	@sudo rm -rf ~/data/wordpress/*
#	@sudo rm -rf ~/data/mariadb/*

fclean:
	@printf "Complete cleaning of the configuration of ${name}\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
#	@sudo rm -rf ~/data/wordpress/*
#	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean
