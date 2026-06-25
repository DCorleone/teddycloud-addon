#!/usr/bin/with-contenv bashio

# Erstelle Verzeichnisse in HA-gemappten Pfaden
mkdir -p /config/teddycloud/certs/client
mkdir -p /config/teddycloud/certs/server
mkdir -p /config/teddycloud/config
mkdir -p /data/teddycloud/content
mkdir -p /data/teddycloud/library
mkdir -p /data/teddycloud/firmware
mkdir -p /data/teddycloud/cache
mkdir -p /data/teddycloud/custom_img
mkdir -p /data/teddycloud/plugins

bashio::log.info "Starting TeddyCloud..."
exec /usr/local/bin/teddycloud
