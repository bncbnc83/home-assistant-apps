# Trilium Notes

Home Assistant wrapper for the official pinned TriliumNext image.

The Home Assistant `addon_config` directory is mounted directly at Trilium's
standard `/home/node/trilium-data` path. This allows Trilium's official startup
script to initialise permissions correctly before dropping privileges.

The timezone is configured in Home Assistant. No user data is stored in Git.
