#!/usr/bin/env bash

export TRAVIS_BRANCH=${TRAVIS_BRANCH:-master}
export NIX_PHP_ATTR=${NIX_PHP_ATTR:-php}
export NIX_CHANNEL=${NIX_CHANNEL:-unstable}

function before_install() (
    set -e -o pipefail
    nix-env -iA cachix -f https://github.com/NixOS/nixpkgs/tarball/889c72032f8595fcd7542c6032c208f6b8033db6
)

function install() {
    return 0
}

function before_script() {
    return 0
}

function script() (
    set -e -o pipefail

    NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-${NIX_CHANNEL}.tar.gz
    nix-build --argstr phpPsrVersion ${TRAVIS_BRANCH} --arg php "(import <nixpkgs> {}).${NIX_PHP_ATTR}" | tee result.txt

    # test the pecl packaging
    pecl_tgz=$(nix-shell -p ${NIX_PHP_ATTR} --command 'pecl package' | grep -v Warning | awk '{print $2}')
    nix-build --arg php "(import <nixpkgs> {}).${NIX_PHP_ATTR}" --arg phpPsrSrc "./${pecl_tgz}"
)

function after_success() (
    set -e -o pipefail
    cat result.txt | cachix push jbboehr-ci
)

function after_failure() {
    return 0
}

function run_all() (
    set -e
    trap after_failure ERR
    before_install
    install
    before_script
    script
    after_success
)
