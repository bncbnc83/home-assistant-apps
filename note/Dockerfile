FROM triliumnext/trilium:v0.105.0

ARG BUILD_VERSION
ARG BUILD_ARCH

COPY run.sh /usr/local/bin/ha-trilium-entrypoint
RUN chmod 0755 /usr/local/bin/ha-trilium-entrypoint

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

ENTRYPOINT ["/usr/local/bin/ha-trilium-entrypoint"]
CMD ["sh", "./start-docker.sh"]
