#!/usr/bin/env bash

#
# Returns the name of the first pending phase in the progress.md file of
# the specified project directory
#

set -ue

project_dir="${1}"
progress_file="${project_dir}/progress.md"

grep -m1 '^ *- \[ \] ' "${progress_file}" | sed 's/^ *- \[ \] //'
