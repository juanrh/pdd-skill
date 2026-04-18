#!/usr/bin/env bash

find pdd-test -mindepth 1 -delete
git checkout pdd-test
cp -r pdd pdd-test/.vibe/skills/
echo
echo
echo "As initial prompt use: setup a new PDD project for idea.md"
echo
