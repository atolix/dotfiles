require'plugins'

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

-- nvim-treesitter --
require('nvim-treesitter.configs').setup {
  sync_install = true,
  auto_install = true,
  endwise = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
    'ruby',
    'elixir',
    'lua',
    'vim',
    'go',
    'rust',
    'typescript'
  },
  indent = {
    enable = true
  }
}

-- gitsign --
vim.api.nvim_create_user_command('Gb', function() -- Show full commit message
  require('gitsigns').blame_line{full=true}
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
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
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
      {
        'filename',
        file_status = true,
        path = 1
      }
    },
    lualine_d = {'buffers'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- nvim-colorizer --
require'colorizer'.setup()

-- scrollbar --
require("scrollbar").setup()

-- nvim-autopairs --
require("nvim-autopairs").setup()

-- bufferline --
require("bufferline").setup()
vim.keymap.set('n', '<C-o>', "<cmd>bprev<CR>") -- Move tp before buffer
vim.keymap.set('n', '<C-p>', "<cmd>bnext<CR>") -- Move to after buffer 

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

vim.keymap.set('n', '<C-f>', "<cmd>FzfLua files<CR>") -- Open FzfLua file finder
vim.keymap.set('n', '<C-b>', "<cmd>FzfLua buffers<CR>") -- Open FzfLua buffer list
vim.keymap.set('n', '<C-g>', "<cmd>FzfLua live_grep<CR>") -- Open FzfLua live grep search

-- Fern --
vim.keymap.set('n', '<C-n>', "<cmd>Fern . -reveal=% -drawer -width=50<CR>") -- Toggle Fern file explorer in drawer mode

-- coc --
vim.keymap.set('n', '<C-[>', "<cmd>call CocActionAsync('jumpDefinition')<CR>") -- Jump to definition
vim.keymap.set('n', '<C-]>', "<cmd>call CocActionAsync('jumpReferences')<CR>") -- Jump to references
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

