vim.api.nvim_create_user_command('Gb', function()
  require('gitsigns').blame_line({ full = true })
end, {})
