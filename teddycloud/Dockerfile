ARG BUILD_FROM=ghcr.io/hassio-addons/ubuntu-base/aarch64:11.0.0
FROM ${BUILD_FROM} AS buildenv

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy root filesystem
COPY rootfs /

# Setze Ausführrechte für s6-Scripts
RUN chmod +x /etc/s6-overlay/s6-rc.d/teddycloud/run \
    && chmod +x /etc/s6-overlay/s6-rc.d/teddycloud/finish \
    && chmod +x /etc/s6-overlay/s6-rc.d/nginx/run \
    && chmod +x /etc/s6-overlay/s6-rc.d/nginx/finish

ARG BUILD_ARCH=aarch64
ARG TEDDYCLOUD_VERSION="tc_v0.6.8"

# Build-Abhängigkeiten installieren
RUN apt-get update \
    && apt-get upgrade -qq \
    && apt-get install -y --no-install-recommends \
         gcc \
         protobuf-c-compiler \
         build-essential \
         git \
         curl

WORKDIR /buildenv
RUN git clone https://github.com/toniebox-reverse-engineering/teddycloud /buildenv \
    && git checkout ${TEDDYCLOUD_VERSION} \
    && curl -f https://raw.githubusercontent.com/toniebox-reverse-engineering/tonies-json/release/tonies.json \
         -o /buildenv/contrib/config/tonies.json || true \
    && curl -f https://raw.githubusercontent.com/toniebox-reverse-engineering/tonies-json/release/tonieboxes.json \
         -o /buildenv/contrib/config/tonieboxes.json || true \
    && git submodule init \
    && git submodule update \
    && make preinstall NO_SANITIZERS=2

FROM ${BUILD_FROM}
EXPOSE 80 443 8443

# Dateien aus Build-Umgebung kopieren
COPY --from=buildenv /buildenv/install/pre/data/www/ /teddycloud/data/www/
COPY --from=buildenv /buildenv/install/pre/*.sh /usr/local/bin/
COPY --from=buildenv /buildenv/install/pre/teddycloud /usr/local/bin/teddycloud

# Runtime-Abhängigkeiten + Symlinks (wie mrueg)
RUN apt-get update \
    && apt-get upgrade -qq \
    && apt-get install -y --no-install-recommends \
         ffmpeg \
         curl \
         ca-certificates \
         nginx \
    && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates \
    && mkdir -p /teddycloud/data/ /teddycloud/data/www/ \
    && ln -s /data/teddycloud/content /teddycloud/data/content \
    && ln -s /data/teddycloud/library /teddycloud/data/library \
    && ln -s /data/teddycloud/custom_img /teddycloud/data/www/custom_img \
    && ln -s /data/teddycloud/plugins /teddycloud/data/www/plugins \
    && ln -s /data/teddycloud/firmware /teddycloud/data/firmware \
    && ln -s /data/teddycloud/cache /teddycloud/data/cache \
    && ln -s /config/teddycloud/certs /teddycloud/certs \
    && ln -s /config/teddycloud/config /teddycloud/config

# Nginx-Config mit IPv6-Fix + rootfs kopieren
COPY rootfs /

# Build-Argumente
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="DCorleone" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.source="https://github.com/DCorleone/teddycloud-addon" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
