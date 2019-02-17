# Load nave- and npm-related functions.
source $DOTFILES/source/50_php.sh init

# Install PHP stack with valet.
brew install php@7.2

wget https://raw.githubusercontent.com/composer/getcomposer.org/cb19f2aa3aeaa2006c0cd69a7ef011eb31463067/web/installer -O - -q | php -- --quiet
mv composer.phar /usr/local/bin/composer
composer global require laravel/valet
valet install

# Serve sites in ~/Sites
mkdir $HOME/Sites
cd $HOME/Sites
valet park
