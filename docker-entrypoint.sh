#!/bin/sh
set -e

# Default values
VITE_GRAPHQL_URI="${VITE_GRAPHQL_URI:-http://54.146.243.208:8082/graphql}"
VITE_SERVER_URI="${VITE_SERVER_URI:-http://54.146.243.208:8082}"

# Replace placeholders in JS files
find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
  "s|__VITE_GRAPHQL_URI_PLACEHOLDER__|${VITE_GRAPHQL_URI}|g" {} +

find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
  "s|__VITE_SERVER_URI_PLACEHOLDER__|${VITE_SERVER_URI}|g" {} +

echo "Configured VITE_GRAPHQL_URI=${VITE_GRAPHQL_URI}"
echo "Configured VITE_SERVER_URI=${VITE_SERVER_URI}"

exec nginx -g 'daemon off;'