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

# Preserve the upstream Node image entrypoint and Trilium's official command.
# The upstream Trilium image intentionally starts its script via:
#   sh ./start-docker.sh
# rather than executing start-docker.sh directly.
exec docker-entrypoint.sh "$@"
