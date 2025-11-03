local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = false,
    theme = 'auto',
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      { 'filename', file_status = true, path = 1 },
    },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { 'filename', file_status = true, path = 1 },
    },
    lualine_x = {},
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})
