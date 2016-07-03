source $HOME/.dotfiles/.common.sh

## Paths
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

path=(
  $DOTFILES/{bin,scripts}
  $HOME/.tmuxifier/bin
  $HOME/bin
  /usr/local/{,s}bin
  $path
)

fpath=(
  ~/.zsh/completions
  $fpath
)

# Browser
export BROWSER='open'

# Editors
export EDITOR=$(is-callable nvim && echo 'nvim' || echo 'vim')
export VISUAL=$EDITOR

export LESS='-g -i -M -R -S -w -z-4'
if is-callable lesspipe; then
  export LESSOPEN='| /usr/bin/env lesspipe %s 2>&-'
fi

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
[[ ! -d "$TMPPREFIX" ]] && mkdir -p "$TMPPREFIX"

[[ -z "$LANG" ]] && export LANG='en_US.UTF-8'

autoload -U colors && colors
