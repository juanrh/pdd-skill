#!/usr/bin/env bash

find pdd-test -mindepth 1 -delete
git checkout pdd-test
cp -r pdd pdd-test/.vibe/skills/
mkdir -p pdd-test/.cline/skills
cp -r pdd-test/.vibe/skills/* pdd-test/.cline/skills
echo
echo
echo "Scaffold project with ../scaffold_uv_project.sh"
echo
echo "Suggested prompts"
echo "- initial prompt use: setup a new PDD project for idea.md using project_name = calc-api"
echo "- continue: PDD skill: continue"
echo "- help: PDD skill: help"
echo
