#!/bin/bash

# wait-for-grid.sh

set -e

cmd="bundle exec cucumber -p default -p chrome -p grid"
count=0

while ! curl -sSL "http://selenium-hub:4444/wd/hub/status" 2>&1 \
        | jq -r '.value.ready' 2>&1 | grep "true" >/dev/null; do
    echo 'Waiting for the Grid'
    count=$((count + 1))
    if [ "$count" -eq 20 ];
    then
      echo 'Grid startup timed out'
      exit 1
    fi
    sleep 1
done

>&2 echo "Selenium Grid is up - executing tests"
exec $cmd
