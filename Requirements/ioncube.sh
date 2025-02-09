
if command -v apt-get >/dev/null; then
wget -4 https://github.com/geeksmax/SSH-Pro/raw/main/Requirements/ioncube_loaders_lin_x86-64.tar.gz
sudo tar xzf ioncube_loaders_lin_x86-64.tar.gz -C /usr/local
sudo rm -rf ioncube_loaders_lin_x86-64.tar.gz
PHPVERSION=$(php -i | grep /.+/php.ini -oE | sed 's/[^0-9.]*//g')
echo "zend_extension = /usr/local/ioncube/ioncube_loader_lin_${PHPVERSION}so" > /etc/php/${PHPVERSION::-1}/apache2/conf.d/00-ioncube.ini
sed -i 's@zend_extension = /usr/local/ioncube/ioncube_loader_lin_${PHPVERSION::-1}.so@@' /etc/php/${PHPVERSION::-1}/cli/php.ini
echo "zend_extension = /usr/local/ioncube/ioncube_loader_lin_${PHPVERSION}so" >> /etc/php/${PHPVERSION::-1}/cli/php.ini
systemctl restart apache2
elif command -v yum >/dev/null; then
wget -4 https://github.com/geeksmax/SSH-Pro/raw/main/Requirements/ioncube_loaders_lin_x86-64.tar.gz
sudo tar xzf ioncube_loaders_lin_x86-64.tar.gz -C /usr/lib64/php/modules
PHPVERSION=$(php -r 'echo PHP_VERSION;')
echo "zend_extension = /usr/lib64/php/modules/ioncube/ioncube_loader_lin_${PHPVERSION::-3}.so" > /etc/php.d/00-ioncube.ini
sed -i 's@zend_extension = /usr/lib64/php/modules/ioncube/ioncube_loader_lin_${PHPVERSION::-3}.so@@' /etc/php/${PHPVERSION::-3}/cli/php.ini
echo "zend_extension = /usr/lib64/php/modules/ioncube/ioncube_loader_lin_${PHPVERSION::-3}.so" >> /etc/php/${PHPVERSION::-3}/cli/php.ini
systemctl restart httpd
fi


if [ $(uname -m) = "aarch64" ]; then
    arch="arm64"
    wget -4 https://github.com/geeksmax/SSH-Pro/raw/main/Requirements/ioncube_loaders_lin_aarch64.tar.gz
    sudo tar xzf ioncube_loaders_lin_aarch64.tar.gz -C /usr/lib/php/20210902
sudo rm -rf ioncube_loaders_lin_aarch64.tar.gz
PHPVERSION=$(php -i | grep /.+/php.ini -oE | sed 's/[^0-9.]*//g')
echo "zend_extension = /usr/lib/php/20210902/ioncube/ioncube_loader_lin_${PHPVERSION}so" > /etc/php/${PHPVERSION::-1}/apache2/conf.d/00-ioncube.ini
echo "zend_extension = /usr/lib/php/20210902/ioncube/ioncube_loader_lin_${PHPVERSION}so" >> /etc/php/${PHPVERSION::-1}/cli/php.ini
systemctl restart apache2
fi

