FROM mysql/mysql-server:5.5
RUN  yum install -y vim
ENV MYSQL_ROOT_PASSWORD root
COPY my.cnf /etc/mysql/my.cnf
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY test.sql /docker-entrypoint-initdb.d/
COPY fullBackupLeontel.sql /docker-entrypoint-initdb.d/
