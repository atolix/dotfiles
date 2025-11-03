# dotfiles

Personal dotfiles that provision my development environment. Running `init.sh` automates the installation of Homebrew, CLI tools, language runtimes, language servers, and creates the required symlinks for each configuration file.

## File Overview

| Path | Purpose |
| --- | --- |
| `init.sh` | Bootstrap script that installs Homebrew, core CLI tools, LSPs, language runtimes, and wires up the configuration symlinks. |
| `zshrc` | Zsh profile that initializes `mise`, `zoxide`, and `starship`, and defines aliases such as `nv`. |
| `starship.toml` | Custom Starship prompt configuration controlling appearance and language version segments. |
| `wezterm/wezterm.lua` | WezTerm config that sets fonts, colors, pane management shortcuts, and window behavior. |
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
| `Ctrl-n` | Toggle the Fern drawer-style file explorer. |
| `Ctrl-[` | Find symbol definitions with FzfLua. |
| `Ctrl-]` | Find references with FzfLua. |

### WezTerm

- Press `Ctrl+1` to enter the leader mode:
  - `Leader + |`: Split the current pane horizontally.
  - `Leader + %`: Split the current pane vertically.
  - `Leader + ←/→/↑/↓`: Move focus to the adjacent pane.
- `Shift+Enter`: Send a newline without leaving the current prompt.

### Zsh

- `nv`: Launch `nvim`.
- `ls`: Expand to `eza -l -a --no-user` for a detailed directory view.
- `gco`: Shortcut for `git checkout`.
- `:q`: Exit.

## Plugin Manager

Neovim plugins are managed with `lazy.nvim` (`nvim/lua/plugins.lua`). On first use it clones itself into `stdpath("data")/lazy/lazy.nvim`, then `require("lazy").setup` loads plugins grouped by UI, LSP, completion, Git, and navigation utilities. Add or remove plugins by editing `plugins.lua`, then run `:Lazy sync` inside Neovim to apply changes.
