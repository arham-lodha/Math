#!/bin/sh
# Link the shared Typst packages in this folder into Typst's local package dir so
# documents anywhere in this repo can `#import "@local/<name>:<version>"`.
# Existing links/dirs are left alone (my-prelude is normally linked to ~/.config/nvim already).
set -e
here=$(cd "$(dirname "$0")" && pwd)
dest="${TYPST_PACKAGE_PATH:-$HOME/Library/Application Support/typst/packages}/local"
for pkg in my-prelude math-homework math-notes; do
  mkdir -p "$dest/$pkg"
  for ver in "$here/$pkg"/*/; do
    v=$(basename "$ver")
    if [ -e "$dest/$pkg/$v" ]; then echo "skip   $pkg/$v (exists)"; else ln -s "${ver%/}" "$dest/$pkg/$v"; echo "linked $pkg/$v"; fi
  done
done
