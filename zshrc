typeset -U path PATH

path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

alias nv='nvim'
alias ls='eza -l -a --no-user'
alias gco='git checkout'
alias :q='exit'

fpath=(~/.zsh $fpath)

export PATH=$PATH:/home/user/go/bin
export FZF_DEFAULT_COMMAND='rg --files'
export BAT_THEME='Nord'
export SPACESHIP_PROMPT_DEFAULT_PREFIX=false

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
