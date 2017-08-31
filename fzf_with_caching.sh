#!/bin/bash

CACHE_DIR=$HOME/.cache/fzf_cache
mkdir -p $CACHE_DIR

# replace all '/' with '%'
CACHE_FILE=$CACHE_DIR/${PWD//\//\%}

if [ ! -e $CACHE_FILE ] || [ $1 == "reindex" ]; then
    echo 'reindex'!
    rg -L --no-ignore-vcs --ignore-file ~/.rgignore --files . > $CACHE_FILE
fi
export FZF_DEFAULT_COMMAND="cat ${CACHE_FILE}"
args="${@:2}"
echo $args
fzf $args
