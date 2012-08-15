#!/bin/sh

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

# Abort provisioning if toolchain is already installed.
# This checks for basic PS2 tools and the SDK.
which ee-gcc iop-gcc ps2client >/dev/null &&
test -d /usr/local/ps2dev/ps2sdk &&
{ echo "PS2 toolchain already installed."; exit 0; }

# Update Debian package index.
sudo apt-get update -y

# Install required Debian packages.
sudo apt-get install -y gcc git-core make patch wget

# Clone, build, and install toolchain.
tmp_dir="/tmp/toolchain"
sudo rm -rf "$tmp_dir"
git clone --depth 1 git://github.com/ps2dev/ps2toolchain.git "$tmp_dir"
( cd "$tmp_dir"; sudo ./toolchain-sudo.sh )

# Clean up build products.
sudo rm -rf "$tmp_dir"

# Set up environment variables, adding the new tools to PATH.
sudo sh -c "cat > /etc/profile.d/ps2dev.sh" <<'EOF'
export PS2DEV=/usr/local/ps2dev
export PS2SDK=$PS2DEV/ps2sdk
export PATH=$PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin
EOF
