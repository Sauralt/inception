FROM debian:bullseye

RUN apt update && \
	apt install -y --no-install-recommends nginx openssl

COPY ./conf/server.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/

COPY --chmod=700 ./tools/nginx.sh /root/

EXPOSE 443

WORKDIR /var/www/html

# Si tu veux copier un site web, mets-le dans un dossier "web" ici :
# srcs/requirements/nginx/web/
# COPY ./web /root/web

ENTRYPOINT [ "/root/nginx.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
