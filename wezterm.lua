local wezterm = require 'wezterm';
local act = wezterm.action;

return {
  font = wezterm.font 'Ricty Diminished',
  font_size = 13,
  use_ime = true,
  color_scheme = 'Kasumi Dark',
  adjust_window_size_when_changing_font_size = false,
  default_cursor_style = 'SteadyUnderline',
  window_background_opacity = 0.90,
  leader = { key = '1', mods = 'CTRL', timeout_milliseconds = 2000 },
  keys = {
    {
      key = '|',
      mods = 'LEADER',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '%',
      mods = 'LEADER',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'LeftArrow',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'RightArrow',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'UpArrow',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'DownArrow',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Down',
    },
  },
}
