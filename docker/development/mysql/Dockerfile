FROM mysql:5.7

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    locales-all \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

ARG FILES
COPY ${FILES}/mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
