Instalacja PostgreSQL:

$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install postgresql
$ sudo apt-get install libpq-dev
$ gem install pg

Zmienić w /etc/postgresql/<version>/main/pg_hba.conf linię
local   all             postgres                                peer
na
local   all             postgres                                trust
$ sudo service postgresql restart
$ psql -U postgres
ALTER USER postgres with password 'hasełko';

Potem zmienić tamto 'trust' na 'md5' i
$ sudo service postgresql restart

Następnie Webpacker i React:

$ rails webpacker:install
$ rails webpacker:install:react
$ rails generate react:install