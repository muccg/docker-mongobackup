#
FROM mongo:3.0
MAINTAINER https://github.com/muccg/

RUN mkdir -p /data \
  && chown mongodb:mongodb /data

COPY automongobackup.sh /
COPY docker-entrypoint.sh /

USER mongodb
ENV HOME /data
WORKDIR /data
VOLUME /data

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["backup"]
