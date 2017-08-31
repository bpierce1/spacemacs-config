#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp $DIR/spacemacs ~/.spacemacs
cp -r $DIR/private/* ~/.emacs/private/
