local ok, modes = pcall(require, 'modes')
if not ok then
  return
end

modes.setup({
  colors = {
    copy = "#f5c359",
    delete = "#c75c6a",
    insert = "#79c0ff",
    visual = "#8957e5",
  },
  line_opacity = 0.4,
  set_cursor = true,
  set_cursorline = true,
  set_number = true,
})
