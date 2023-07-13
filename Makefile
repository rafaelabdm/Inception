all: set_host up

set_host:
	@grep -q rabustam /etc/hosts || sudo sed -i "3i127.0.0.1\trabustam.42.fr" /etc/hosts

up:
	docker-compose -f ./srcs/docker-compose.yml up --build --detach

down:
	docker-compose -f ./srcs/docker-compose.yml down
