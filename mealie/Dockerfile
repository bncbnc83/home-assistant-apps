FROM ghcr.io/mealie-recipes/mealie:v3.25.1

ARG BUILD_VERSION
ARG BUILD_ARCH

COPY run.sh /usr/local/bin/ha-mealie-start
RUN chmod 0755 /usr/local/bin/ha-mealie-start

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

ENTRYPOINT ["/usr/local/bin/ha-mealie-start"]
