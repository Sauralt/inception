# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    var_handler.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mgarsaul <mgarsaul@student.42lehavre.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/16 11:46:37 by mgarsaul          #+#    #+#              #
#    Updated: 2024/02/19 09:04:18 by mgarsaul         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Replacing ports from env
sed -i "s/REPLACE_UTK_PORT/$UTK_PORT/g" /etc/nginx/nginx.conf
sed -i "s/REPLACE_SW_PORT/$SW_PORT/g" /etc/nginx/nginx.conf
sed -i "s/REPLACE_ADM_PORT/$ADM_PORT/g" /etc/nginx/nginx.conf
sed -i "s/REPLACE_WP_PORT/$WP_PORT/g" /etc/nginx/nginx.conf

# Start Nginx in the foreground
nginx -g "daemon off;"