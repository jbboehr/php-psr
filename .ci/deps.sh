#!/usr/bin/env bash

DEPS_JSON=.ci/deps.json
DEPS_EVAL=$(jq -r 'to_entries | .[] | .key + "=\"" + .value + "\""' .ci/deps.json)
eval "${DEPS_EVAL}"
