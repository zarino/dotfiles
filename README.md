# To set up on a new Mac:

    cd
    git clone git@github.com:zarino/dotfiles.git
    cd dotfiles
    script/update

# Manual post-setup

Create a MySQL user for Sequel Ace, eg:

    mysql
    > CREATE USER 'sequelace'@'localhost' IDENTIFIED BY 'sequelace';
    > GRANT ALL PRIVILEGES ON *.* TO 'sequelace'@'localhost';
    > FLUSH PRIVILEGES;
