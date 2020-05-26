#!/usr/bin/env bash

export TRAVIS_BRANCH=${TRAVIS_BRANCH:-master}
export NIX_PHP_ATTR=${NIX_PHP_ATTR:-php}
export NIX_CHANNEL=${NIX_CHANNEL:-unstable}

function before_install() (
    return 0
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
    nix-build --argstr phpPsrVersion ${TRAVIS_BRANCH} --arg php "(import <nixpkgs> {}).${NIX_PHP_ATTR}"
)

function after_success() (
    return 0
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
