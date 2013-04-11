#!/bin/bash

source_dirs=(~/workspace/moz-graphs ~/workspace/git/mapping/ncbo ~/workspace/git/mapping/common)

# Thanks, stackoverflow
PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

${PWD}/todos.sh "${source_dirs[@]}"
