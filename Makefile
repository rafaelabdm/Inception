all: set_host
	@ sudo mkdir -p /home/rabustam/data/mysql
	@ docker volume create --name mariadb_volume --opt type=none --opt device=/home/rabustam/data/mysql --opt o=bind
	@ sudo mkdir -p /home/rabustam/data/wordpress
	@ docker volume create --name wordpress_volume --opt type=none --opt device=/home/rabustam/data/wordpress --opt o=bind
	@ docker-compose -f ./srcs/docker-compose.yml up -d --build

set_host:
	@ sudo grep -q rabustam /etc/hosts || sudo sed -i "3i127.0.0.1\trabustam.42.fr" /etc/hosts

up:
	@ sudo docker-compose -f ./srcs/docker-compose.yml up --build --detach

down:
	@ sudo docker-compose -f ./srcs/docker-compose.yml down
