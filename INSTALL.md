```bash
# bitwasp configuration
# tested in debian in virtualbox

# be a root
sudo su

# dependency
apt-get install apache2 mysql-server mysql-client php5 libapache2-mod-php5 php5-mcrypt php5-gnupg php5-mysql php5-gmp php5-curl php5-gd git

cd /var/www
git clone https://github.com/galzuntpanz/BitWasp

php5enmod mysqli mcrypt curl gmp gd

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

cp htaccess.example .htaccess
# comment out 'RewriteBase /bitwasp'
vim .htaccess

# access to /install/ and follow instruction there
iceweasel http://localhost/install/

# And if `php /var/www/bitwasp/index.php db` succeeds, everything's done!
```
