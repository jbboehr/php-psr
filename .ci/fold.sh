#!/usr/bin/env bash

# adapted from: https://gist.github.com/prisis/e050c4da44c6ee7fa1519912eac19563

set -e -o pipefail

nanoseconds() {
    local cmd="date"
    local format="+%s%N"
    local os=$(uname)

    if hash gdate > /dev/null 2>&1; then
        cmd="gdate"
    elif [[ "$os" = Darwin ]]; then
        format="+%s000000000"
    fi

    $cmd -u $format
}

# Arguments:
#   $1 fold name
#   $2 command to execute
travisfold () (
    set -e -o pipefail
    local title=$1
    shift
    local fold=$(echo "$title" | sed -r 's/[^-_A-Za-z\d]+/./g')
    local id=$(printf %08x $(( RANDOM * RANDOM )))
    local start=$(nanoseconds)

    function travisfoldend() {
        local end=$(nanoseconds)
        echo -e "\\ntravis_time:end:$id:start=$start,finish=$end,duration=$(($end-$start))"
        if [ "$1" == "true" ]; then
            echo -e "\\e[41mKO\\e[0m $title\\n"
        else
            echo -e "\\e[32mOK\\e[0m $title\\n\\ntravis_fold:end:$fold"
        fi
    }

    echo -e "travis_fold:start:$fold"
    echo -e "travis_time:start:$id"
    echo -e "\\e[1;34m$title\\e[0m"

    trap "travisfoldend true" EXIT
    $*
    trap - EXIT
    travisfoldend
)

function githubfold () (
    set -e -o pipefail
    local name=$1
    shift

    echo "::group::$name"
    $*
    echo "::endgroup::"
)

function nullfold () (
    set -e -o pipefail
    shift
    $*
)

function cifold () (
    set -e -o pipefail
    if [[ ! -z "${TRAVIS}" ]]; then
        travisfold "$@"
    elif [[ ! -z "${GITHUB_RUN_ID}" ]]; then
        githubfold "$@"
    else
        nullfold "$@"
    fi
)
