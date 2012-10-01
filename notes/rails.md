sudo ln -s /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/lib/libmysqlclient.18.dylib


Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)

sudo /usr/local/mysql/scripts/mysql_install_db  --user=mysql --basedir=/usr/local/mysql
sudo /usr/local/mysql/bin/mysqld_safe &




rails generate scaffold Bank --migration=false

rails generate scaffold Computer --no-migration

glpi_computers
