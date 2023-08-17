# zabbix

docker run --name some-zabbix-server-mysql -e DB_SERVER_HOST="some-mysql-server" -e MYSQL_USER="some-user" -e MYSQL_PASSWORD="some-password" -d zabbix/zabbix-server-mysql:ubuntu-trunk