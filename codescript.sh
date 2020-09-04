#!/usr/local/bin/bash
  
read -p  "Enter URL: " url


header="$(curl -Isk ${url}  | head -1 | awk '{ print $2 }')"

if [ ${header} != "200" ]; then
  echo "${header}"
  echo "redirecting to $(curl -Isk ${url}  | head -5 | tail -1 | awk '{ print $2 }')"
  echo "$( curl -IskL ${url}  | head -8 | tail -1)"

else
  echo "NOT RESPONDING"
fi
