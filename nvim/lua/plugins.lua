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

  -- Code analysis & Completion
  { 'nvim-treesitter/nvim-treesitter', branch = 'master', lazy = false, build = ":TSUpdate" },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'L3MON4D3/LuaSnip' } },

  -- Git integration
  { 'tpope/vim-fugitive' },
  { 'lewis6991/gitsigns.nvim' },

  -- Navigation & File explorer
  { 'ibhagwan/fzf-lua' },
  { 'lambdalisue/fern.vim' },
  { 'lambdalisue/fern-git-status.vim' },

  -- Utility tools
  { 'windwp/nvim-autopairs' },
})
