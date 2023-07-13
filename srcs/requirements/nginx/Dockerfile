FROM debian:oldstable

RUN apt update -y && apt upgrade -y && \
	apt install nginx -y && apt install openssl -y

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/rabustam.key \
	-out /etc/ssl/certs/rabustam.crt

COPY ./https.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]