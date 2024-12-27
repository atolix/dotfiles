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

# Create Sym Links
mkdir .config && cd .config
ln -sf ~/dotfiles/config/starship.toml ~/.config/starship.toml

mkdir wezterm
ln -sf ~/dotfiles/wezterm.lua ~/.config/wezterm/wezterm.lua

mkdir ./wezterm/colors
ln -sf ~/dotfiles/wezterm/colors/kasumi-dark.toml ~/.config/wezterm/colors/kasumi-dark.toml

mkdir nvim
ln -sf ~/dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua

mkdir ./nvim/lua
ln -sf ~/dotfiles/nvim/plugins.lua ~/.config/nvim/lua/plugins.lua

ln -sf ~/dotfiles/zshrc ~/.zshrc

source .zshrc
