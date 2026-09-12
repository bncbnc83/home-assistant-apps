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

exec sh ./start-docker.sh
