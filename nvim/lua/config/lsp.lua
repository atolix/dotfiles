local lsp_names = {
  'lua_ls',
  'ts_ls',
  'gopls',
  'solargraph',
  'zls',
}

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      border = "rounded",
      scope = "cursor",
    })
  end,
})

vim.keymap.set('n', '<C-[>', function()
  require('fzf-lua').lsp_definitions()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-]>', function()
  require('fzf-lua').lsp_references()
end, { noremap = true, silent = true })

vim.lsp.enable(lsp_names)

local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local lsp_config = {}

if cmp_ok then
  lsp_config.capabilities = cmp_nvim_lsp.default_capabilities()
end

vim.lsp.config('*', lsp_config)
