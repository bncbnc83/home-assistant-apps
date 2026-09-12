# Mealie

Home Assistant wrapper for the official pinned Mealie image.

`BASE_URL`, if needed, is configured in Home Assistant and is deliberately not
stored in Git. The timezone and signup setting are also controlled from Home
Assistant.

Persistent data is stored in Home Assistant `addon_config` and mounted at
`/app/data`.

For major-version upgrades, create a backup and review Mealie's upstream
migration notes before changing the pinned image version.
