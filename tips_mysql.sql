LOAD DATA LOCAL INFILE '/home/jose/Descargas/a.csv'
INTO TABLE untraceable
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(created_at, updated_at, sms_date, sou_id, sms_id, clientid, phone);

#is not in GROUP BY clause and contains nonaggregated column
# cli login mysql and execute
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


select user, host from mysql.user;
CREATE USER 'Q5vfWIfGl9SV'@'%' IDENTIFIED BY 'root_pass';
GRANT ALL PRIVILEGES ON homestead.* TO 'Q5vfWIfGl9SV'@'%';

# binlog + maxwell
show variables like 'log_bin';
show variables like 'binlog_format';
show variables like '%binlog%';

/*
[mysqld]
log-bin=mysql-bin # open binlog
binlog-format=ROW # Set the Binary Log recording method to Row
server_id=1 # Remember the id will be used in subsequent development
*/

CREATE USER sync IDENTIFIED BY 'sync';  
GRANT SELECT, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'sync'@'%';
-- GRANT ALL PRIVILEGES ON *.* TO 'sync'@'%' ;
FLUSH PRIVILEGES;

CREATE USER 'maxwell'@'%' IDENTIFIED BY 'XXXXXX';
GRANT ALL ON maxwell.* TO 'maxwell'@'%';
GRANT SELECT, REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'maxwell'@'%';