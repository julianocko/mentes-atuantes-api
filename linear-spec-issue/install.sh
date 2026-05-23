#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="linear-spec-issue"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.codex/skills/${SKILL_NAME}"

mkdir -p "${TARGET_DIR}"
cp -R "${SOURCE_DIR}/." "${TARGET_DIR}/"
chmod +x "${TARGET_DIR}/install.sh" || true

echo "Skill '${SKILL_NAME}' installed at: ${TARGET_DIR}"
echo "Usage example: /skill ${SKILL_NAME}"
