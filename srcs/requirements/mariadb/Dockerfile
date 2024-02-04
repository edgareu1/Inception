FROM alpine:3.16

ARG MYSQL_NAME \
	MYSQL_ROOT_PASSWORD \
	MYSQL_USER \
	MYSQL_PASSWORD

# Install MariaDB
RUN apk update && \
	apk add --no-cache mariadb mariadb-client

# Create a Docker-specific MariaDB configuration file for optimizations and configurations;
# Modify the default MariaDB configuration file so that it works on the Docker environment (enable networking).
RUN mkdir /var/run/mysqld; \
	chmod 777 /var/run/mysqld; \
	{ \
		echo '[mysqld]'; \
		echo 'skip-host-cache'; \
		echo 'skip-name-resolve'; \
		echo 'bind-address=0.0.0.0'; \
	} | tee  /etc/my.cnf.d/docker.cnf; \
	sed -i "s|skip-networking|skip-networking=0|g" \
	/etc/my.cnf.d/mariadb-server.cnf

# Initialize the MySQL data directory
# Set up the system tables needed by MariaDB
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Listen on port 3306 at runtime
EXPOSE 3306

# Create the DBs (MariaDB and Wordpress), set up users, and grants privileges.
COPY requirements/mariadb/conf/db_create.sh .

RUN sh db_create.sh && \
	rm db_create.sh

# Set the user
USER mysql

# Run MySQL and continue running even if errors are encounted during startup.
CMD ["/usr/bin/mysqld", "--skip-log-error"]
