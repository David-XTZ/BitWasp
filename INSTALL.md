Apache
===

```bash
# bitwasp configuration
# tested in debian in virtualbox

# be a root
sudo su

# dependency
apt-get install apache2 mysql-server mysql-client php5 libapache2-mod-php5 php5-mcrypt php5-gnupg php5-mysql php5-gmp php5-curl php5-gd git
php5enmod mysqli mcrypt curl gmp gd

# install bitwasp src
cd /var/www
git clone https://github.com/galzuntpanz/BitWasp && cd BitWasp

# get composer and install dependency
wget https://getcomposer.org/composer.phar
php composer.phar install
chown user:user -R .
rm composer.phar

a2enmod rewrite
service apache2 restart

# install bitcoin
cd /tmp
wget https://bitcoin.org/bin/bitcoin-core-0.12.0/bitcoin-0.12.0-linux32.tar.gz # or 32bit
tar xzf bitcoin-0.12.0-linux32.tar.gz
cd bitcoin-0.12.0
cp bin/* /usr/local/bin/

# run bitcoin
sudo -u user bitcoind -daemon -testnet

# change AllowOverride All for /var/www
vim /etc/apache2/apache2.conf

# change DocumentRoot to /var/www/bitwasp
vim /etc/apache2/sites-enabled/000-default.conf
service apache2 restart

# add mysql user and add database for him
CREATE DATABASE bitwasp;
CREATE USER bitwasp IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON bitwasp.* TO bitwasp@localhost IDENTIFIED BY 'password';

cp htaccess.sample .htaccess
# comment out 'RewriteBase /bitwasp'
vim .htaccess

# access to /install/ and follow instruction there
iceweasel http://localhost/install/

# And if `php /var/www/bitwasp/index.php db` succeeds, everything's done!
```

Nginx
===

```bash
# bitwasp configuration
# tested in debian in virtualbox

# be a root
sudo su

# dependency
apt-get install nginx mysql-server mysql-client php5-fpm php5-mcrypt php5-gnupg php5-mysql php5-gmp php5-curl php5-gd git
php5enmod mysqli mcrypt curl gmp gd

# install bitwasp src
cd /var/www
git clone https://github.com/galzuntpanz/BitWasp && cd BitWasp

# get composer and install dependency
wget https://getcomposer.org/composer.phar
php composer.phar install
chown user:user -R .
rm composer.phar

# install bitcoin
cd /tmp
wget https://bitcoin.org/bin/bitcoin-core-0.12.0/bitcoin-0.12.0-linux32.tar.gz # or 32bit
tar xzf bitcoin-0.12.0-linux32.tar.gz
cd bitcoin-0.12.0
cp bin/* /usr/local/bin/

# run bitcoin. also edit ~/.bitcoin/bitcoin.conf as you like
sudo -u user bitcoind -daemon -testnet

# prepare bitwasp executor user
groupadd bitwasp
useradd -g bitwasp bitwasp

cp /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/bitwasp.conf
vim /etc/php5/fpm/pool.d/bitwasp.conf
## edit as following
# [bitwasp]
# user = bitwasp
# group = bitwasp
# listen = /var/run/php5-fpm-bitwasp.sock
# listen.owner = www-data
# listen.group = www-data
# php_admin_value[disable_functions] = exec,passthru,shell_exec,system
# php_admin_flag[allow_url_fopen] = off

vim /etc/php5/fpm/conf.d/05-opcache.ini
## edit as following
# opcache.enable=0

# restart php-fpm
service php5-fpm restart

# nginx settting
cp bitwasp-nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/bitwasp-nginx.conf /etc/nginx/sites-enabled/
service nginx restart

# add mysql user and add database for him
CREATE DATABASE bitwasp;
CREATE USER bitwasp IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON bitwasp.* TO bitwasp@localhost IDENTIFIED BY 'password';

# access to /install/ and follow instruction there
iceweasel http://localhost/install/

# And if `php /var/www/bitwasp/index.php db` succeeds, everything's done!
```
