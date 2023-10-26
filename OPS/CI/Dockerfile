FROM ubuntu:22.04

ENV PROFILE /dev/null

# UPDATE & UPGRADE SYSTEM
RUN apt-get update -y && apt-get upgrade -y > /dev/null

# CONFIG TZDATA AND INSTALL IT
RUN  echo 'tzdata tzdata/Areas select Europe' >> /tmp/preseed.cfg &&\
 echo 'tzdata tzdata/Zones/Europe select Paris' >> /tmp/preseed.cfg &&\
 rm -f /etc/timezone /etc/localtime &&\
 apt-get update -y && apt-get install -y tzdata > /dev/null

# INSTALL PHP & DEPENDENCIES | CURL | GPG | CA-CERTIFICATES | GNUPG | NANO | GIT
RUN apt-get install -y > /dev/null \
 php \
 libapache2-mod-php \
 php-mysql \
 php-cli \
 php-common \
 php-zip \
 php-gd \
 php-mbstring \
 php-curl \
 php-xml \
 php-bcmath \
 php-sqlite3 \
 ca-certificates \
 curl \
 gnupg \
 gpg  \
 nano \
 git \
 php-xdebug 

# INSTALL COMPOSER
RUN  curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php &&\
 HASH=`curl -sS https://composer.github.io/installer.sig` &&\
 php -r "if(hash_file('SHA384','/tmp/composer-setup.php') === '$HASH') {echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php');} echo PHP_EOL;" &&\
 php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer


# INSTALL NODEJS AND NPM
RUN curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh &&\
 bash nodesource_setup.sh &&\
 apt-get install nodejs -y &&\
 npm install npm -g
