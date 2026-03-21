install_xcode_tools() {
  echo ">>> Ensuring Xcode Command Line Tools (if needed)..."

  if ! xcode-select -p >/dev/null 2>&1; then
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    softwareupdate -l >/dev/null 2>&1 || true

    CLT_LABEL="$(
      softwareupdate -l 2>&1 |
        awk -F'*' '/Command Line Tools for Xcode/{print $2}' |
        sed 's/^ Label: //;s/^ *//;q' || true
    )"

    if [[ -n "${CLT_LABEL}" ]]; then
      sudo softwareupdate -i "${CLT_LABEL}" --verbose
      sudo xcode-select --switch /Library/Developer/CommandLineTools
    fi

    rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  else
    echo ">>> Command Line Tools already installed."
  fi
}

install_xcode_tools
