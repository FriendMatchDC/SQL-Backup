#! /bin/sh
TIMESTAMP=`date '+%Y-%m-%d_%H:%M:%S'`
echo $TIMESTAMP
BACKUP_DIR="/home/backup/mysql"
MYSQL_USER="backup"
MYSQL=/usr/bin/mysql
MYSQL_PASSWORD="SET_PASSWORD"
MYSQLDUMP=/usr/bin/mysqldump
 
databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql|sys)"`
 
for db in $databases; do
  FILENAME="${TIMESTAMP}_${db}.sql.gz"
  $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db | gzip > "$BACKUP_DIR/$FILENAME"
done
