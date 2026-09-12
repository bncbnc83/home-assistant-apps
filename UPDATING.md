# Updating the apps

This repository uses explicit upstream image versions.

## Standard update checklist

For a normal update:

1. Check the upstream release notes.
2. Back up the app.
3. Edit the app's `Dockerfile` and change the `FROM ...:<version>` tag.
4. Edit the app's `config.yaml` and set `version:` to the same version.
5. Commit and push.
6. In Home Assistant, reload the app store.
7. Confirm `update_available: true`.
8. Update the app.
9. Confirm the app starts normally and verify the important data/functionality.

Do not change persistent-data mappings during a routine version bump unless the
upstream application explicitly requires it.

## Trilium Notes

Files normally changed:

- `note/Dockerfile`
- `note/config.yaml`

Persistent data is mounted at:

`/home/node/trilium-data`

If used behind a reverse proxy, `trustedReverseProxy` belongs in Trilium's
persistent `config.ini`, not in this public repository.

## Mealie

Files normally changed:

- `mealie/Dockerfile`
- `mealie/config.yaml`

Persistent data is mounted at:

`/app/data`

For major-version upgrades, review Mealie's migration notes before changing the
version.

## Flame Dashboard / Flame Dashboard 2

Files normally changed:

- `flame/Dockerfile`
- `flame/config.yaml`
- `aflame/Dockerfile`
- `aflame/config.yaml`

The two instances may be updated together. Keep their host ports distinct:

- `flame`: 5005
- `aflame`: 5006

Persistent data is mounted at:

`/app/data`
