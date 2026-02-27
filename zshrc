# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -U path PATH

path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

eval "$(mise activate zsh)"

alias nv='nvim'
alias :q='exit'
alias ls='eza -l -a --no-user'
alias gco='git checkout'

fpath=(~/.zsh $fpath)

export PATH=$PATH:/home/user/go/bin
export FZF_DEFAULT_COMMAND='rg --files'
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/git-prompt.sh
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit -u

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
