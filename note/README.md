# Trilium Notes

Home Assistant wrapper for the official pinned TriliumNext image.

The Home Assistant `addon_config` directory is mounted directly at Trilium's
standard `/home/node/trilium-data` path.

The wrapper reads the timezone from Home Assistant and then hands control back
to the upstream Docker entrypoint. Trilium's official startup command,
`sh ./start-docker.sh`, is preserved.

## Reverse proxy

If Trilium is accessed through a reverse proxy that sets `X-Forwarded-For`,
configure the persistent Trilium `config.ini` as appropriate for that
environment, for example:

```ini
[Network]
trustedReverseProxy=true
```

This setting is intentionally not stored in Git because proxy trust is
deployment-specific.

No user data is stored in this repository.
