# Trilium Notes

Home Assistant wrapper for the official pinned TriliumNext image.

The Home Assistant `addon_config` directory is mounted directly at Trilium's
standard `/home/node/trilium-data` path.

The wrapper only reads the timezone from Home Assistant and then hands control
back to the upstream Docker entrypoint. The official Trilium startup command,
`sh ./start-docker.sh`, is preserved unchanged.

No user data is stored in Git.
