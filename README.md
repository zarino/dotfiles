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

[There’s a bug which means yt-dlp can’t find the mutagen Python library](https://github.com/yt-dlp/yt-dlp/issues/1809),
so you need to install it manually into the pip environment that yt-dlp
is using (you can check this via `yt-dlp --verbose`). Eg:

    /opt/homebrew/bin/pip3.9 install mutagen
