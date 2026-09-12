FROM triliumnext/trilium:v0.105.0

ARG BUILD_VERSION
ARG BUILD_ARCH

COPY run.sh /usr/local/bin/ha-trilium-start
RUN chmod 0755 /usr/local/bin/ha-trilium-start

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

CMD ["/usr/local/bin/ha-trilium-start"]
