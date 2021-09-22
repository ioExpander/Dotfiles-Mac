#Use this only for profiling ZSH
#zmodload zsh/zprof

source /opt/homebrew/share/antigen/antigen.zsh

HIST_STAMPS="yyyy-mm-dd" # Format the output of history for oh-my-zsh

antigen use oh-my-zsh
antigen bundle colored-man-pages
antigen bundle common-aliases
antigen bundle docker
antigen bundle git
antigen bundle sudo # add sudo in front of last CMD with ESC ESC combo
antigen bundle kubectl
antigen bundle fasd # use j <FolderName> to jump or v FileName to edit
antigen bundle fd   # find replacement auto-completion
antigen bundle zsh_reload  # reloads zsh config by running 'src'
if [ -x "$(command -v fzf)" ]; then
    antigen bundle fzf # fuzzy auto complete (Ctrl - T for files) (Ctrl - R for history)
    # (cd xyz**<TAB> for fuzzy completion
fi
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions              # Additional completion files
antigen bundle zsh-users/zsh-syntax-highlighting      #needs to be loaded before history-substring search
antigen bundle zsh-users/zsh-history-substring-search # search a substring in history with arrow keys

antigen theme spaceship-prompt/spaceship-prompt

# Tell antigen that you're done
antigen apply

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Set personal aliases
alias tmux="tmux -2"
alias gwdiff="git diff --word-diff=color -b -w --ignore-blank-lines --ignore-space-at-eol"
alias gdiff="git diff --ignore-space-at-eol -b -w --ignore-blank-lines"
unalias gdu #Conflict with gdu tool

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

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Load private settings... if found
if [ -f ~/.zshrc_privateSettings ]; then
    source ~/.zshrc_privateSettings
fi

#Use for debugging startup time
#zprof