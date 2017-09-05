#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d
git checkout develop
git pull --rebase origin develop
cd -
mkdir -p ~/bin
cp $DIR/fzf_with_caching.sh ~/bin/
