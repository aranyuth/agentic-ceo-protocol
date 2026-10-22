#!/usr/bin/env bash
# Agentic CEO Protocol v2.0 - Bash Rule Installer
# Installs core rules into global agent configuration directories on Linux and macOS.

set -euo pipefail

CURSOR_FLAG=false
WINDSURF_FLAG=false
OPENCODE_FLAG=false
ALL_FLAG=false
TARGET_DIR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --cursor)
      CURSOR_FLAG=true
      shift
      ;;
    --windsurf)
      WINDSURF_FLAG=true
      shift
      ;;
    --opencode)
      OPENCODE_FLAG=true
      shift
      ;;
    --all)
      ALL_FLAG=true
      shift
      ;;
    --target-dir)
      TARGET_DIR="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_RULES_DIR="${SCRIPT_DIR}/rules"

if [[ ! -d "${SOURCE_RULES_DIR}" ]]; then
  echo "Error: Source rules directory not found at ${SOURCE_RULES_DIR}" >&2
  exit 1
fi

DESTINATIONS=()

if [[ -n "${TARGET_DIR}" ]]; then
  DESTINATIONS+=("${TARGET_DIR}")
else
  DESTINATIONS+=("${HOME}/.gemini/config/rules")
  if [[ "${CURSOR_FLAG}" == true || "${ALL_FLAG}" == true || -d "${HOME}/.cursor" ]]; then
    DESTINATIONS+=("${HOME}/.cursor/rules")
  fi
  if [[ "${WINDSURF_FLAG}" == true || "${ALL_FLAG}" == true ]]; then
    DESTINATIONS+=("${HOME}/.codeium/windsurf/memories")
  fi
  if [[ "${OPENCODE_FLAG}" == true || "${ALL_FLAG}" == true ]]; then
    DESTINATIONS+=("${HOME}/.omp/rules")
  fi
fi

# Remove duplicates
UNIQUE_DESTS=($(echo "${DESTINATIONS[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

for DEST in "${UNIQUE_DESTS[@]}"; do
  mkdir -p "${DEST}"
  echo "Deploying rules to: ${DEST}"
  for RULE_FILE in "${SOURCE_RULES_DIR}"/*.md; do
    if [[ -f "${RULE_FILE}" ]]; then
      cp -f "${RULE_FILE}" "${DEST}/"
      echo "  -> Installed: $(basename "${RULE_FILE}")"
    fi
  done
done

echo "Installation completed successfully!"
