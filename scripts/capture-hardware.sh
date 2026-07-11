#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${1:-hardware-inventory}"
mkdir -p "$OUT_DIR"

run() {
  local name="$1"
  shift
  printf 'Collecting %s...\n' "$name"
  if command -v "$1" >/dev/null 2>&1; then
    "$@" >"$OUT_DIR/$name.txt" 2>&1 || true
  else
    printf 'Command not available: %s\n' "$1" >"$OUT_DIR/$name.txt"
  fi
}

run lspci lspci -nnk
run lsusb lsusb
run lsblk lsblk -o NAME,MODEL,SIZE,TYPE,FSTYPE,TRAN
run cpuinfo cat /proc/cpuinfo
run rfkill rfkill list
run ip-link ip link

if command -v inxi >/dev/null 2>&1; then
  inxi -Faz >"$OUT_DIR/inxi.txt" 2>&1 || true
fi

if command -v dmidecode >/dev/null 2>&1 && [[ ${EUID:-$(id -u)} -eq 0 ]]; then
  dmidecode -t system -t baseboard -t bios >"$OUT_DIR/dmidecode.txt" 2>&1 || true
else
  printf 'Run as root with dmidecode installed to collect DMI data.\n' >"$OUT_DIR/dmidecode.txt"
fi

cat <<'NOTICE'

Inventory captured.

Before committing any output, remove or redact:
- serial numbers
- MAC addresses
- UUIDs
- hostnames
- asset tags
- personally identifying paths or labels

Review every file manually. This script does not promise automatic sanitization.
NOTICE
