#!/bin/bash

set -eux

YEAR=`date +%Y`
START=`date -j -f "%Y/%m/%d %H:%M:%S" "${YEAR}/12/31 22:13:00" +%s`
TIMES=0

while [ $TIMES -lt 108 ]; do
  TARGET=`date -r ${START} -v +${TIMES}M +%s`
  LANG=en_US COMMIT=`date -r ${TARGET} +"%a %b %d %H:%M:00 %Y +0900"`
  git commit --allow-empty --message "${COMMIT}" --date="${COMMIT}"
  TIMES=$((TIMES + 1))
done
