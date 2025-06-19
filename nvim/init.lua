require'plugins'

-- Keymap Summary:
-- +-----------+-------------------------------+
-- | Keybinding| Action                        |
-- +-----------+-------------------------------+
-- | <C-h>     | Horizontal split window       |
-- | <C-v>     | Vertical split window         |
-- | <C-o>     | Move to previous buffer       |
-- | <C-p>     | Move to next buffer           |
-- | <C-f>     | Open FzfLua file finder       |
-- | <C-b>     | Open FzfLua buffer list       |
-- | <C-g>     | Open FzfLua live grep         |
-- | <C-n>     | Toggle Fern file explorer     |
-- | <C-[>     | Jump to definition (coc)      |
-- | <C-]>     | Jump to references (coc)      |
-- | <C-a>     | Open Claude Code              |
-- | <C-x>     | Send selection to Claude Code |
-- | <C-w>     | Send current file to Claude   |
-- +-----------+-------------------------------+

-- base --
vim.opt.clipboard:append{'unnamedplus'}
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.number = true
vim.opt.pumblend = 20
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.winblend = 20

vim.keymap.set('n', '<C-h>', '<cmd>split<CR>') -- `ctrl + h` -> Horizontal split window
vim.keymap.set('n', '<C-v>', '<cmd>vsplit<CR>') -- `ctrl + v` -> Vertical split window

-- nvim-treesitter --
require('nvim-treesitter.configs').setup {
  auto_install = true,
  endwise = { enable = true },
  ensure_installed = {
    'ruby',
    'elixir',
    'lua',
    'vim',
    'go',
    'rust',
    'typescript'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  sync_install = true
}

-- gitsign --
vim.api.nvim_create_user_command('Gb', function() -- :Gb -> Show full commit message
  require('gitsigns').blame_line{ full=true }
end, {})

-- colorscheme --
require('github-theme').setup({
  transparent = true,
  comment_style = 'NONE',
  function_style = 'NONE',
  keyword_style = 'NONE',
})
vim.cmd [[
  autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
  autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
  autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none
  autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
  autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none
]]

-- lualine --
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      { 'filename', file_status = true, path = 1 }
    },
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { 'filename', file_status = true, path = 1 }
    },
    lualine_x = {},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

-- nvim-colorizer --
require'colorizer'.setup()

-- scrollbar --
require("scrollbar").setup()

-- nvim-autopairs --
require("nvim-autopairs").setup()

-- bufferline --
require("bufferline").setup()
vim.keymap.set('n', '<C-o>', "<cmd>bprev<CR>") -- `ctrl + o` -> Move to previous buffer
vim.keymap.set('n', '<C-p>', "<cmd>bnext<CR>") -- `ctrl + p` -> Move to next buffer

-- fzf-lua --
require'fzf-lua'.setup({
  winopts = {
    height     = 0.85,
    width      = 0.80,
    row        = 0.35,
    col        = 0.50,
    border     = 'rounded'
  },
})

vim.cmd [[
highlight FzfLuaNormal ctermbg=none guibg=none
highlight FzfLuaBorder ctermbg=none guibg=none
]]

vim.keymap.set('n', '<C-f>', "<cmd>FzfLua files<CR>") -- `ctrl + f` -> Open FzfLua file finder
vim.keymap.set('n', '<C-b>', "<cmd>FzfLua buffers<CR>") -- `ctrl + b` -> Open FzfLua buffer list
vim.keymap.set('n', '<C-g>', "<cmd>FzfLua live_grep<CR>") -- `ctrl + g` -> Open FzfLua live grep search

-- Fern --
vim.keymap.set('n', '<C-n>', "<cmd>Fern . -reveal=% -drawer -width=50<CR>") -- `ctrl + n` -> Toggle Fern file explorer in drawer mode

-- coc --
vim.keymap.set('n', '<C-[>', "<cmd>call CocActionAsync('jumpDefinition')<CR>") -- `ctrl + [` -> Jump to definition
vim.keymap.set('n', '<C-]>', "<cmd>call CocActionAsync('jumpReferences')<CR>") -- `ctrl + ]` -> Jump to references
vim.keymap.set(
    'i',
    '<CR>',
    function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#confirm']()
        else
            return "<CR>"
        end
    end,
    { expr = true }
)

-- Claude Code --
vim.keymap.set('n', '<C-a>', "<cmd>ClaudeCodeFocus<CR>") -- `ctrl + a` -> Open Claude Code
vim.keymap.set('v', '<C-x>', "<cmd>ClaudeCodeSend<CR>") -- `ctrl + x` -> Send visual selection to Claude Code
vim.keymap.set('n', '<C-w>', "<cmd>ClaudeCodeAdd %<CR>") -- `ctrl + w` -> Send current file to Claude Code
