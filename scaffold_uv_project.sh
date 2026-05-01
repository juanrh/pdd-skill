#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Portable in-place sed: macOS (BSD) requires -i '', Linux (GNU) requires -i
sedi() {
    if [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' "$@"
    else
        sed -i "$@"
    fi
}

# See params on
# https://github.com/osprey-oss/cookiecutter-uv/blob/main/cookiecutter.json

# Run cookiecutter in a temporary directory to avoid polluting pdd-test on failure
TMP_DIR=$(mktemp -d)
trap 'rm -rf "${TMP_DIR}"' EXIT

pushd "${TMP_DIR}"

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

popd

# Copy the generated project to pdd-test
DEST_DIR="${SCRIPT_DIR}/pdd-test/calc-api"
rm -rf "${DEST_DIR}"
cp -R "${TMP_DIR}/calc-api" "${DEST_DIR}"

# Prevent precommit messing up with the whole git repo
sedi '/@uv run pre-commit install/d' "${DEST_DIR}/Makefile"
sedi 's/@uv run pre-commit run -a/@uv run pre-commit run --files ./g' "${DEST_DIR}/Makefile"
pushd "${DEST_DIR}"
make install check
make check test
popd

echo "Project scaffolding complete"
