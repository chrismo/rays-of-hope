#!/usr/bin/env bash

function css() {
  # you can tack on --watch for continuous updates
  npx tailwindcss -i ./src/input.css -o ./src/output.css

  # give us a blank line here
  {
    echo ""
    echo ""
    echo "/* copy in glide css - see ./build.sh */"
  } >> ./src/output.css

  # `npm install @glidejs/glide` if these don't exist locally
  cat node_modules/@glidejs/glide/dist/css/glide.core.css >> ./src/output.css
  cat node_modules/@glidejs/glide/dist/css/glide.theme.css >> ./src/output.css

  # intentionally _overwriting_ with `>` since it's been empty before this
  cat node_modules/@glidejs/glide/dist/glide.min.js > ./src/script.js
}

function usage() {
  grep -E '^function' "${BASH_SOURCE[0]}" | sort
}

if [ $# -eq 0 ]; then
  usage
else
  "$@"
fi
