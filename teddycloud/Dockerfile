FROM ghcr.io/toniebox-reverse-engineering/teddycloud:latest

# IPv6-Fix und Pfad-Symlinks
COPY rootfs/ /

RUN echo '#!/bin/sh\n\
mkdir -p /config/teddycloud/certs\n\
mkdir -p /config/teddycloud/config\n\
mkdir -p /data/teddycloud\n\
rm -rf /teddycloud/certs /teddycloud/config /teddycloud/data\n\
ln -sf /config/teddycloud/certs /teddycloud/certs\n\
ln -sf /config/teddycloud/config /teddycloud/config\n\
ln -sf /data/teddycloud /teddycloud/data\n\
exec /docker-entrypoint.sh' > /start.sh && chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
