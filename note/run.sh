#!/bin/sh
set -eu

TZ="$(node -e '
  const fs = require("fs");
  let options = {};
  try {
    options = JSON.parse(fs.readFileSync("/data/options.json", "utf8"));
  } catch (_) {}
  process.stdout.write(options.TZ || "UTC");
')"

export TZ

# Use Trilium's own startup script. It starts as root, fixes ownership of
# /home/node/trilium-data, then drops privileges to the configured node user.
exec ./start-docker.sh
