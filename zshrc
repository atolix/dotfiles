typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

alias nv='nvim'
alias ls='exa -l --no-user'

eval "$(goenv init -)"
eval "$(nodenv init -)"
eval "$(rbenv init -)"
eval "$(zoxide init zsh)"

fpath=(~/.zsh $fpath)

export PATH=$PATH:/home/user/go/bin
export PGDATA=/usr/local/var/postgres
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export FZF_DEFAULT_COMMAND='rg --files'
export BAT_THEME='Nord'
export SPACESHIP_PROMPT_DEFAULT_PREFIX=false
export PATH="/usr/local/opt/llvm/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"
source "$HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
