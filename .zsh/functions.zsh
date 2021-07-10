## functions
#
# Add Commit Push at once
# Usage:
# acp "commit message"
function acp() {
  git add .
  git commit -m "$1"
  git push
}

# Open all modified files in vim tabs
function vimod {
  vim -p $(git status -suall | awk '{print $2}')
}

# Open files modified in a git commit in vim tabs; defaults to HEAD.
# Examples:
#     virev 49808d5
#     virev HEAD~3
function virev {
  commit=$1
  if [ -z "${commit}" ]; then
    commit="HEAD"
  fi
  rootdir=$(git rev-parse --show-toplevel)
  sourceFiles=$(git show --name-only --pretty="format:" ${commit} | grep -v '^$')
  toOpen=""
  for file in ${sourceFiles}; do
    file="${rootdir}/${file}"
    if [ -e "${file}" ]; then
      toOpen="${toOpen} ${file}"
    fi
  done
  if [ -z "${toOpen}" ]; then
    echo "No files were modified in ${commit}"
    return 1
  fi
  vim -p ${toOpen}
}

### upgrade homebrew ###
#
function update() {
  echo 'Starting update...'

  echo 'updating homebrew'
  brew update
  brew upgrade
  brew cleanup
}
