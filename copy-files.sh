#!/bin/bash

# Ensure we're in the right directory
cd "$(dirname "$0")"

# Create static/files directory if it doesn't exist
mkdir -p static/files

# Remove any existing files to ensure clean state
rm -rf static/files/*

# Copy all files from ks-sbc-obsidian/files to static/files
cp -r ks-sbc-obsidian/files/* static/files/

echo "Files copied successfully from ks-sbc-obsidian/files/ to static/files/"
