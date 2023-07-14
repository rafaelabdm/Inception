FROM debian:oldstable

RUN apt update -y && apt upgrade && apt install -y \
	nginx \
	openssl

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/rabustam.key \
	-out /etc/ssl/certs/rabustam.crt

RUN rm -f /etc/nginx/sites-enabled/default

COPY ./conf/default.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]