#!/bin/bash
BIN_DIRECTORY="$HOME/.local/bin"

# remove folder if already exixts
rm -rf /tmp/lucky_cli

# clone lucky_cli
cd /tmp
git clone https://github.com/luckyframework/lucky_cli --branch v0.12.0 --depth 1
cd lucky_cli

# build lucky_cli
shards install
crystal build src/lucky.cr --release --no-debug

# move in binaries directory
mkdir -p "$BIN_DIRECTORY"
mv /tmp/lucky_cli/lucky "$BIN_DIRECTORY"

# Load the bin directory
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc

echo ''
echo ''
echo "Instalation success. Run 'source ~/.bashrc' to use lucky in this session"
