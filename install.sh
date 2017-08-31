#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d
git checkout develop
git pull --rebase origin develop
cd -
cp $DIR/spacemacs ~/.spacemacs
cp -r $DIR/private/* ~/.emacs.d/private/
