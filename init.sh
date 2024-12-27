# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Tools
brew install google-chrome slack docker wezterm starship neovim fzf zoxide eza ripgrep bat volta git tig gh

# Clone dotfiles
git clone git@github.com:atolix/dotfiles.git

# Get git-completion and git-prompt
mkdir .zsh
curl -o ./.zsh/git-completion.zsh  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
curl -o ./.zsh/git-prompt.sh  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh


