# dotfiles

Personal dotfiles that provision my development environment. Running `init.sh` automates the installation of Homebrew, CLI tools, language runtimes, language servers, and creates the required symlinks for each configuration file.

## File Overview

| Path | Purpose |
| --- | --- |
| `init.sh` | Bootstrap script that installs Homebrew, core CLI tools, LSPs, language runtimes, and wires up the configuration symlinks. |
| `zshrc` | Zsh profile that initializes `mise` and `starship`, and defines aliases such as `nv`. |
| `ghostty/config` | Ghostty terminal config for font, opacity, keybindings, and macOS UI behavior. |
| `nvim/` | Neovim setup. `init.lua` loads modules from `lua/config/`, while `plugins.lua` declares all plugins. |

## Shortcuts

### Neovim

| Input | Action |
| --- | --- |
| `Ctrl-h` | Open a horizontal split (`:split`). |
| `Ctrl-v` | Open a vertical split (`:vsplit`). |
| `Ctrl-o` / `Ctrl-p` | Navigate to the previous/next buffer. |
| `Ctrl-f` | Launch FzfLua file finder. |
| `Ctrl-b` | Open the FzfLua buffer list. |
| `Ctrl-g` | Run a live grep search via FzfLua. |
| `Ctrl-n` | Open the current file's parent directory in Oil. |
| `Ctrl-[` | Find symbol definitions with FzfLua. |
| `Ctrl-]` | Find references with FzfLua. |

### Zsh

- `nv`: Launch `nvim`.
- `:q`: Exit.

## Plugin Manager

Neovim plugins are managed with `lazy.nvim` (`nvim/lua/plugins.lua`). On first use it clones itself into `stdpath("data")/lazy/lazy.nvim`, then `require("lazy").setup` loads plugins grouped by UI, LSP, completion, Git, and navigation utilities. Add or remove plugins by editing `plugins.lua`, then run `:Lazy sync` inside Neovim to apply changes.
