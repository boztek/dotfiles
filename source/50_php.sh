export PATH

# Make sure the ~/.composer/vendor/bin directory is in your system's "PATH".
PATH="$(path_remove $HOME/.composer/vendor/bin):$HOME/.composer/vendor/bin"

# Use PHP 7.2 CLI
PATH="/usr/local/opt/php@7.2/bin:$(path_remove /usr/local/opt/php@7.2/bin)"
PATH="/usr/local/opt/php@7.2/sbin:$(path_remove /usr/local/opt/php@7.2/sbin)"
