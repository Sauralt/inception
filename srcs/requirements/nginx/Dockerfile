# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mgarsaul <mgarsaul@student.42lehavre.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 16:30:39 by mgarsaul          #+#    #+#              #
#    Updated: 2024/02/16 12:05:55 by mgarsaul         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

# Updating and installing dependencies
RUN apk update \
 && apk add --no-cache nginx openssl

# Creating needed directories
RUN mkdir -p /run/nginx /etc/nginx/ssl /var/www/html /tmp

# Creating our certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/mgarsaul-selfsigned.key \
	-out /etc/nginx/ssl/mgarsaul-selfsigned.crt \
	-subj "/C=FR/ST=PACA/L=lehavre/O=42/OU=mgarsaul/CN=mgarsaul.42.fr"

# Modifying permissions to be sure
RUN chmod -R 755 /var/www/html

# Copying our configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/index.html /var/www/html/index.html
COPY ./tools/var_handler.sh /tmp/var_handler.sh

# Handling port replacement
RUN chmod +x /tmp/var_handler.sh

# Allowing needed port
EXPOSE 443

# Running NGINX in background
CMD ["sh", "/tmp/var_handler.sh"]
