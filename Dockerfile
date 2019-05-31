FROM php:7
RUN apt-get -y update

COPY commands.sh /scripts/commands.sh
RUN ["chmod", "+x", "/scripts/commands.sh"]
RUN docker-php-ext-install pcntl

RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep

RUN apt-get update -y
RUN apt-get install openssh-server -y
RUN systemctl enable ssh

ENTRYPOINT ["/scripts/commands.sh"]
WORKDIR /workdir
