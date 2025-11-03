# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Tools
brew install google-chrome slack docker wezterm starship neovim fzf zoxide eza ripgrep bat mise git tig gh

# Install languages via mise
mise use --global node@latest
mise use --global go@latest
mise use --global ruby@latest
mise use --global zig@latest

# Install LSPs
brew install lua-language-server gopls zls
npm install -g typescript typescript-language-server
gem install solargraph

# Clone dotfiles
git clone git@github.com:atolix/dotfiles.git

# Get git-completion and git-prompt
mkdir .zsh
curl -o ./.zsh/git-completion.zsh  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
curl -o ./.zsh/git-prompt.sh  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# Create Sym Links
mkdir .config && cd .config
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

mkdir wezterm
ln -sf ~/dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

mkdir nvim
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua

mkdir ./nvim/lua
ln -sf ~/dotfiles/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua
ln -sf ~/dotfiles/nvim/lua/config ~/.config/nvim/lua/config

ln -sf ~/dotfiles/zshrc ~/.zshrc

source .zshrc
