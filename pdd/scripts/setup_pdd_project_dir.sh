#!/usr/bin/env bash

#
# Setups a new PDD directory
#
# If the project directory already exists then it prints and
# error message and stops without creating any directory
#

set -ueo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <project_name>" >&2
  exit 1
fi

project_name="${1}"

# Validate project_name: only allow alphanumeric, hyphens, and underscores
if ! [[ "${project_name}" =~ ^[a-zA-Z0-9_-]+$ ]]; then
  echo "Error: project_name must contain only alphanumeric characters, hyphens, and underscores, got '${project_name}'" >&2
  exit 1
fi

project_dir="./.agents/planning/${project_name}"

if [ -d "${project_dir}" ]; then
  echo "PDD project with name ${project_name} already exists at ${project_dir}, aborting"
  exit 2
fi

mkdir -p "${project_dir}"
touch "${project_dir}/rough-idea.md"
touch "${project_dir}/idea-honing.md"
mkdir -p "${project_dir}/research"
mkdir -p "${project_dir}/design"
mkdir -p "${project_dir}/implementation"
mkdir -p "${project_dir}/implementation/tasks"
echo '- [x] Project setup
- [ ] Requirements Clarification
- [ ] Preliminary Research
- [ ] Technical design
- [ ] Implementation' > "${project_dir}/progress.md"

echo
echo "New PDD project with name ${project_name} created at ${project_dir}"
find "${project_dir}"
