#!/usr/bin/env bash

find pdd-test -mindepth 1 -delete
git checkout pdd-test
cp -r pdd pdd-test/.vibe/skills/
echo
echo
echo "Suggested prompts"
echo "- initial prompt use: setup a new PDD project for idea.md using project_name = calc-api"
echo "- continue: PDD skill continue"
echo "- help: PDD skill help"
echo
