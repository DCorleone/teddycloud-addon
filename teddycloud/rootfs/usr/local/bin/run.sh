#!/bin/bash
set -e

# Erstelle Zielverzeichnisse in HA-gemappten Pfaden
mkdir -p /config/teddycloud/certs
mkdir -p /config/teddycloud/config
mkdir -p /data/teddycloud/content
mkdir -p /data/teddycloud/library
mkdir -p /data/teddycloud/firmware
mkdir -p /data/teddycloud/cache
mkdir -p /data/teddycloud/www/custom_img

# Lösche die vom Image deklarierten Volumes und ersetze durch Symlinks
rm -rf /teddycloud/certs && ln -sf /config/teddycloud/certs /teddycloud/certs
rm -rf /teddycloud/config && ln -sf /config/teddycloud/config /teddycloud/config
rm -rf /teddycloud/data/content && ln -sf /data/teddycloud/content /teddycloud/data/content
rm -rf /teddycloud/data/library && ln -sf /data/teddycloud/library /teddycloud/data/library
rm -rf /teddycloud/data/firmware && ln -sf /data/teddycloud/firmware /teddycloud/data/firmware
rm -rf /teddycloud/data/cache && ln -sf /data/teddycloud/cache /teddycloud/data/cache
rm -rf /teddycloud/data/www/custom_img && ln -sf /data/teddycloud/www/custom_img /teddycloud/data/www/custom_img

# Starte TeddyCloud
exec /docker-entrypoint.sh
