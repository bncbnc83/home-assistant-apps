#!/bin/sh
set -eu

read_option() {
  key="$1"
  fallback="$2"
  python3 - "$key" "$fallback" <<'PY'
import json
import sys

key = sys.argv[1]
fallback = sys.argv[2]

try:
    with open("/data/options.json", "r", encoding="utf-8") as f:
        options = json.load(f)
except Exception:
    options = {}

value = options.get(key)
if value is None or value == "":
    value = fallback

if isinstance(value, bool):
    value = "true" if value else "false"

print(value, end="")
PY
}

TZ="$(read_option TZ UTC)"
ALLOW_SIGNUP="$(read_option ALLOW_SIGNUP false)"
BASE_URL="$(read_option BASE_URL "")"

export TZ
export ALLOW_SIGNUP

if [ -n "${BASE_URL}" ]; then
  export BASE_URL
else
  unset BASE_URL 2>/dev/null || true
fi

exec /app/run.sh
