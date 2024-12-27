# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Tools
brew install google-chrome slack docker wezterm starship neovim fzf zoxide eza ripgrep bat volta git tig gh

# clone dotfiles
git clone git@github.com:atolix/dotfiles.git
