#!/usr/bin/env bash
set -euo pipefail

USER_NAME="admin"
USER_HOME="/Users/${USER_NAME}"
BREW_PREFIX="/opt/homebrew"

echo ">>> Prepping Homebrew paths so installer won't prompt for sudo..."
# Create Homebrew prefix owned by the user
echo "${USER_NAME}" | sudo -S install -d -o "${USER_NAME}" -g wheel -m 0755 "${BREW_PREFIX}"

# Ensure PATH integration file exists (so installer doesn't sudo-write it)
echo "${USER_NAME}" | sudo -S install -d -o root -g wheel -m 0755 /etc/paths.d
echo "${BREW_PREFIX}/bin" | sudo tee /etc/paths.d/homebrew >/dev/null
echo "${USER_NAME}" | sudo -S chmod a+r /etc/paths.d/homebrew

# (Optional but recommended) ensure CLTs if missing; won't error if present
echo ">>> Ensuring Xcode Command Line Tools (if needed)..."
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress || true
softwareupdate -l >/dev/null 2>&1 || true
CLT_LABEL="$(softwareupdate -l 2>&1 | awk -F'*' '/Command Line Tools for Xcode/{print $2}' \
           | sed 's/^ Label: //;s/^ *//;q' || true)"
if [[ -n "${CLT_LABEL:-}" ]]; then
  echo "${USER_NAME}" | sudo -S softwareupdate -i "$CLT_LABEL" --verbose || true
  sudo xcode-select --switch /Library/Developer/CommandLineTools || true
fi
rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress || true

echo ">>> Installing Homebrew (non-interactive)..."
export NONINTERACTIVE=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make brew available for this session and for future shells
echo "eval \"\$(${BREW_PREFIX}/bin/brew shellenv)\"" >> "${USER_HOME}/.zprofile"
eval "$(${BREW_PREFIX}/bin/brew shellenv)"

# Quick sanity
brew --version || true
echo "Homebrew install step finished."

brew install mactop
