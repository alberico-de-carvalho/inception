COMPOSE = docker compose -f srcs/docker-compose.yml
DATA = /home/$(USER)/data

all: up

up:
	mkdir -p $(DATA)/mariadb $(DATA)/wordpress
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

logs:
	$(COMPOSE) logs -f

clean:
	$(COMPOSE) down -v --rmi all

fclean: clean
	sudo rm -rf $(DATA)
	docker system prune -af

re: fclean all

.PHONY: all up down start stop logs clean fclean re
