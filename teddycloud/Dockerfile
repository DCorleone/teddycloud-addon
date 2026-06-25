FROM ghcr.io/toniebox-reverse-engineering/teddycloud:latest

COPY rootfs/ /
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]
