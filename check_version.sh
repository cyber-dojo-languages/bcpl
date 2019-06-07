#!/bin/bash
set -e

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
readonly EXPECTED=$(cat ${MY_DIR}/README.md | grep Version | cut -d'=' -f2 | cut -d']' -f1)
readonly ACTUAL=$(docker run --rm -it cyberdojofoundation/bcpl sh -c '/distribution/BCPL/cintcode/bin/cintsys64 -v')

if echo "${ACTUAL}" | grep -q "${EXPECTED}"; then
  echo "VERSION CONFIRMED as ${EXPECTED}"
else
  echo "VERSION EXPECTED: ${EXPECTED}"
  echo "VERSION   ACTUAL: ${ACTUAL}"
  exit 1
fi
