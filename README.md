# SQL-Backup
---

Backup Verzeichnis erstellen und mit ``chmod`` schützen.
```bash
mkdir -p ~/backup/mysql
chmod 0700 ~/backup
```

MySQL Backup User erstellen und Rechte anpassen.
```bash
sudo mysql
```
```sql
CREATE USER 'backup'@'localhost' IDENTIFIED BY 'SET_PASSWORD';
GRANT SELECT, RELOAD, SHOW DATABASES, LOCK TABLES, SHOW VIEW ON *.* TO 'backup'@'localhost';
FLUSH PRIVILEGES;
```

Das ``sql_backup.sh`` Skript in folgendes Verzeichnes verschieben: ``~/backup/``. Danach die Rechte des Skripts anpassen.
```shell
chmod +x ~/backup/sql_backup.sh
```

Zu letzt noch das Skript automatisch täglich via. Cronjob ausführen lassen.
```shell
crontab -e
```
Danach erscheint eine Datei, in dieser folgenden Cronjob anlegen:
```shell
00 3 * * * /home/backup/sql_backup.sh > /dev/null 2>&1
```

Nun wir die komplette MySQL-Datenbank täglich um ``3:00 UTC+2`` in ``/backup/mysql/`` gesichert!


**WICHTIG:** Bitte das SQL Account Passwort noch in der Shell-Datei angeben!
