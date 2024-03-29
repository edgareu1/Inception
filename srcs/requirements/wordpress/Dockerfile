FROM alpine:3.16

ARG PHP_VERSION=8 \
	MYSQL_NAME \
	MYSQL_ROOT_PASSWORD \
	MYSQL_USER \
	MYSQL_PASSWORD

# Install Wordpress related packages
# Adjust the listen settings on the PHP-FPM configuration files
RUN apk update && \
	apk upgrade && \
	apk add --no-cache \
		php${PHP_VERSION} \
		php${PHP_VERSION}-fpm \
		php${PHP_VERSION}-mysqli \
		php${PHP_VERSION}-json \
		php${PHP_VERSION}-curl \
		php${PHP_VERSION}-dom \
		php${PHP_VERSION}-exif \
		php${PHP_VERSION}-fileinfo \
		php${PHP_VERSION}-mbstring \
		php${PHP_VERSION}-openssl \
		php${PHP_VERSION}-xml \
		php${PHP_VERSION}-zip \
		php${PHP_VERSION}-redis \
		wget \
		unzip && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
		/etc/php8/php-fpm.d/www.conf && \
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
		/etc/php8/php-fpm.d/www.conf && \
	sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
		/etc/php8/php-fpm.d/www.conf && \
	rm -f /var/cache/apk/*

WORKDIR /var/www

# Install Wordpress
RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	cp -rf wordpress/* . && \
	rm -rf wordpress latest.zip

# It starts PHP-FPM in foreground mode
# Handles PHP requests
CMD ["/usr/sbin/php-fpm8", "-F"]
