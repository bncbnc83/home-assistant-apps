#!/bin/sh
set -eu

read_option() {
  key="$1"
  fallback="$2"
  node -e '
    const fs = require("fs");
    const key = process.argv[1];
    const fallback = process.argv[2];
    let options = {};
    try {
      options = JSON.parse(fs.readFileSync("/data/options.json", "utf8"));
    } catch (_) {}
    const value = options[key];
    process.stdout.write(
      value === undefined || value === null || value === "" ? fallback : String(value)
    );
  ' "$key" "$fallback"
}

PASSWORD="$(read_option PASSWORD "")"
TZ="$(read_option TZ UTC)"

if [ -z "${PASSWORD}" ]; then
  echo "ERROR: PASSWORD must be configured in the Home Assistant app settings." >&2
  exit 1
fi

export PASSWORD
export TZ
export NODE_ENV=production

chown -R node:node /app/data 2>/dev/null || true

exec node /app/server.js
