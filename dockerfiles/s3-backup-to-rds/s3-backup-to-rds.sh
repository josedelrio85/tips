#!bin/sh

today=`date +%Y_%m_%d`

echo "/root/.local/bin/aws s3 cp $S3_BACKUP_PATH${today}.sql.gz ."

~/.local/bin/aws s3 cp $S3_BACKUP_PATH${today}.sql.gz .

echo "gunzip < ${today}.sql.gz | mysql -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASS"

gunzip < ${today}.sql.gz | mysql -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASS
