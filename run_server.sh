#!/usr/bin/env bash
set -euo pipefail

# Avoid accidentally using Windows Ruby/Bundler from inside WSL.
export PATH="$(printf '%s' "$PATH" | tr ':' '\n' | grep -vE '^/mnt/c/Ruby40-x64/bin$' | paste -sd ':' -)"
export PATH="$HOME/.gem/ruby/2.7.0/bin:/var/lib/gems/2.7.0/bin:$PATH"
hash -r

exec bundle exec jekyll serve --livereload --force_polling
