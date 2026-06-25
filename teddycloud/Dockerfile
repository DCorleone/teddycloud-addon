ARG BUILD_FROM
FROM ghcr.io/toniebox-reverse-engineering/teddycloud:tc_v0.6.8_ubuntu

# IPv6-Fix: Nginx auf IPv4 umstellen
COPY rootfs/ /

# Entrypoint bleibt der originale
ENTRYPOINT ["/docker-entrypoint.sh"]
