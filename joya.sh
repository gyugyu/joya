#!/bin/bash

set -eux

YEAR=`date +%Y`
START=`date -j -f "%Y/%m/%d %H:%M:%S" "${YEAR}/12/31 22:13:00" +%s`
DAYS=0

while [ $DAYS -lt 108 ]; do
  TARGET=`date -r ${START} -v +${DAYS}M +%s`
  LANG=en_US COMMIT=`date -r ${TARGET} +"%a %b %d %H:%M:00 %Y +0900"`
  git commit --allow-empty --message "${COMMIT}" --date="${COMMIT}"
  DAYS=$((DAYS + 1))
done
