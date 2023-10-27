#!/usr/bin/env just --justfile
set dotenv-load := true

default:
    just --list

build-lockfile:
    poetry lock -vv

dev-install:
    just build-lockfile
    poetry install

run-tests:
    ruff check .
    pytest tests/

install-and-run-tests:
    just dev-install
    just run-tests

launch-jupyter-lab:
    cd notebooks/  && jupyter lab
