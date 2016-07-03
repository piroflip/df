### zshrc

if [ ! -d ~/.zgen ]; then
    echo "Zgen isn't installed! Run install.sh"
    exit 1
fi

source ~/.zsh/config

source ~/.zgen/zgen.zsh
if ! zgen saved; then
    echo "Creating zgen save"
    [[ -d "$CACHE_DIR" ]] && rm -f "$CACHE_DIR/*"

    zgen oh-my-zsh
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/tmux

    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-completions src
    is-ssh || zgen load zsh-users/zsh-syntax-highlighting

    zgen save
fi

if is-interactive; then
    source ~/.zsh/keybinds
    source ~/.zsh/prompt
    source ~/.zsh/completion
fi

if is-interactive; then
    cache fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install
    cache tmuxifier init -
fi

source ~/.zsh/aliases

# Done!
