# Load nave- and npm-related functions.
source $DOTFILES/source/50_php.sh init

# Install PHP stack with valet.
brew install php@7.2
wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q | php -- --quiet
mv composer.phar /usr/local/bin/composer
composer global require laravel/valet
valet install
