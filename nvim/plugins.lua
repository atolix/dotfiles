require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'windwp/nvim-autopairs' }
  use 'tpope/vim-fugitive'
  use {
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
  }
  use 'ibhagwan/fzf-lua'
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/fern-git-status.vim'
  use 'norcalli/nvim-colorizer.lua'
  use "lukas-reineke/indent-blankline.nvim"
  use 'nvim-treesitter/nvim-treesitter'
  use { 'petertriho/nvim-scrollbar' }
  use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }
  use {'neoclide/coc.nvim', branch = 'release'}
end)
