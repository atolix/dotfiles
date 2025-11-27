typeset -U path PATH

path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

eval "$(mise activate zsh)"
eval "$(starship init zsh)"

alias nv='nvim'
alias :q='exit'
alias ls='eza -l -a --no-user'
alias gco='git checkout'

fpath=(~/.zsh $fpath)

export PATH=$PATH:/home/user/go/bin
export FZF_DEFAULT_COMMAND='rg --files'
export SPACESHIP_PROMPT_DEFAULT_PREFIX=false

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/git-prompt.sh
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit -u
