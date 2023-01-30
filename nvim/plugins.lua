require'packer'.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'windwp/nvim-autopairs' }
  use 'j-hui/fidget.nvim'
  use 'tpope/vim-fugitive'
  use 'obaland/vfiler.vim'
  use 'obaland/vfiler-fzf'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
  end
  }
  use 'ibhagwan/fzf-lua'
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/fern-git-status.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use {'neoclide/coc.nvim', branch = 'release'}
end)
