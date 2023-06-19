### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/aditye/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Load compinit module required for some plugins.
autoload -Uz compinit
compinit

# Some config
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# source antidote
source $HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load


# Set personal aliases
alias tmux="tmux -2"
alias gwdiff="git diff --word-diff=color -b -w --ignore-blank-lines --ignore-space-at-eol"
alias gdiff="git diff --ignore-space-at-eol -b -w --ignore-blank-lines"

# ls alias if exa is found
if [ -x "$(command -v exa)" ]; then
    alias ls='exa'
    alias ll='exa -lh'
    alias la='exa -lha'
    alias l="exa"
fi

# Grep aliases if rg is detected
if [ -x "$(command -v rg)" ]; then
    alias grep='nocorrect rg'
fi

# gdu aliases if gdu is detected
if [ -x "$(command -v gdu)" ]; then
    alias ncdu='gdu'
fi

# Brew aliases if rg is detected
if [ -x "$(command -v brew)" ]; then
    alias ibrew='arch -x86_64 /usr/local/Homebrew/bin/brew'
    alias brew_clean='brew cleanup --prune=1 -s'
fi

# Load private settings... if found
if [ -f ~/.zshrc_privateSettings ]; then
    source ~/.zshrc_privateSettings
fi

#to put at the end
eval "$(zoxide init zsh)"
eval "$(starship init zsh)" # starship prompt