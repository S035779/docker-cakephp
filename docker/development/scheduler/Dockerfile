FROM alpine:3.9

ARG FILES

RUN set -eu \
  && rm -rf /var/cache/apk/* && rm -rf /tmp/* \
  && apk update \
  && apk add --update --no-cache \
    tzdata \
    mysql-client \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && apk del --purge tzdata \
  && echo "DATE         : $(date)" \
  && echo "FILES        : ${FILES}"

# Install docker binary.
RUN wget \
  https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz -O - \
  | tar -xzC /usr/local/bin --strip=1 docker/docker

COPY ${FILES}/docker-crond-entrypoint /usr/local/bin/

ENTRYPOINT ["docker-crond-entrypoint"]

# mysql connection attempt.
COPY ${FILES}/run.sh /usr/local/bin/
# wordpress crontab schedule.
COPY ${FILES}/crontab /var/spool/cron/crontabs/root

RUN chmod 755 /usr/local/bin/docker-crond-entrypoint \
  && chmod 755 /usr/local/bin/run.sh \
  && chmod 600 /var/spool/cron/crontabs/root

RUN addgroup -g 1000 -S www-data \
  && adduser -u 1000 -S www-data -G www-data

CMD ["-l", "2", "-f"]
