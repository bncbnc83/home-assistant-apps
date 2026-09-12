# Home Assistant Apps

A small Home Assistant app repository built around pinned upstream container
images.

## Included apps

| App | Upstream | Current version | Default host port |
| --- | --- | ---: | ---: |
| Trilium Notes | TriliumNext | 0.105.0 | 8080 |
| Mealie | Mealie | 3.25.1 | 4010 |
| Flame Dashboard | Flame | 2.4.0 | 5005 |
| Flame Dashboard 2 | Flame | 2.4.0 | 5006 |

Each app keeps its persistent data in Home Assistant `addon_config`. Updating
this repository therefore changes the app wrapper/image, not the user's stored
application data.

## Privacy and secrets

This repository intentionally contains no instance-specific data.

Deployment-specific values belong in the Home Assistant app configuration and
remain on the Home Assistant system.

## Installing the repository

Add the repository URL to Home Assistant under:

`Settings -> Apps -> App store -> Repositories`

The apps will then appear in the Home Assistant app store.

## Updating an app

Upstream images are deliberately pinned to explicit versions instead of
`latest`.

Before updating an app:

1. Read the upstream release notes, especially for major-version upgrades.
2. Create a Home Assistant backup or a cold backup of the app's
   `addon_config`.
3. Change the image tag in the app's `Dockerfile`.
4. Change `version:` in the same app's `config.yaml` to the matching version.
5. Commit and push the change.
6. Reload the Home Assistant app store.
7. Verify that Home Assistant reports an update for the installed app.
8. Update the app and verify its logs and application data.

For Flame, remember that `flame/` and `aflame/` are two separate Home Assistant
apps using the same upstream project.

See [UPDATING.md](UPDATING.md) for a concise maintenance checklist.

## Trilium reverse proxy note

When Trilium is accessed through a reverse proxy that supplies
`X-Forwarded-For`, configure Trilium's persistent `config.ini` appropriately,
for example:

```ini
[Network]
trustedReverseProxy=true
```

This is intentionally **not** hardcoded in the repository because it is
deployment-specific. Only enable trust for a proxy setup you control.

## Backups

The app definitions use Home Assistant's `backup: cold` setting. For important
upgrades, also keep an independent backup of the persistent app data until the
new version has been verified.

## Upstream projects

- TriliumNext: https://github.com/TriliumNext/Trilium
- Mealie: https://github.com/mealie-recipes/mealie
- Flame: https://github.com/pawelmalak/flame
