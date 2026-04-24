#!/usr/bin/env bash

set -ue

project_dir="${1}"
progress_file="${project_dir}/progress.md"

grep -m1 '^ *- \[ \] ' "${progress_file}" | sed 's/^ *- \[ \] //'
