#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# See params on
# https://github.com/osprey-oss/cookiecutter-uv/blob/main/cookiecutter.json

pushd "${SCRIPT_DIR}/pdd-test"

uvx cookiecutter --no-input \
  https://github.com/osprey-oss/cookiecutter-uv \
  project_name="calc-api" \
  project_slug="calc_api" \
  layout="src" \
  include_github_actions="n" \
  publish_to_pypi="n" \
  deptry="n" \
  docs_tool="none" \
  codecov="n" \
  dockerfile="y" \
  devcontainer="n" \
  type_checker="mypy" \
  open_source_license="Apache Software License 2.0"

echo ''> calc-api/.pre-commit-config.yaml
sed -i '/@uv run pre-commit install/d' calc-api/Makefile
pushd calc-api
make install check
make check test
popd
rm -rf  ../.git/hooks/pre-commit
popd

echo "Project scaffolding complete"
