local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- UI & Appearance
  { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'petertriho/nvim-scrollbar' },
  'norcalli/nvim-colorizer.lua',
  "lukas-reineke/indent-blankline.nvim",

  -- Code analysis & Completion
  'github/copilot.vim',
  { 'nvim-treesitter/nvim-treesitter', branch = 'master', lazy = false, build = ":TSUpdate" },
  'neovim/nvim-lspconfig',
  {
  "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Git integration
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
         current_line_blame = true,
         current_line_blame_opts = {
           virt_text = true,
           virt_text_pos = 'eol',
           delay = 1000,
           ignore_whitespace = false,
         },
         current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      })
    end
  },

  -- Navigation & File explorer
  'ibhagwan/fzf-lua',
  'lambdalisue/fern.vim',
  'lambdalisue/fern-git-status.vim',

  -- Utility tools
  { 'windwp/nvim-autopairs' },
})
