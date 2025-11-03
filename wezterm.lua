local wezterm = require 'wezterm';
local act = wezterm.action;

return {
  font = wezterm.font 'Ricty Diminished',
  font_size = 14,
  use_ime = true,
  color_scheme = 'Sequoia Monochrome',
  adjust_window_size_when_changing_font_size = false,
  default_cursor_style = 'SteadyUnderline',
  window_background_opacity = 0.80,
  macos_window_background_blur = 0,
  show_new_tab_button_in_tab_bar = false,
  window_frame = {
   inactive_titlebar_bg = "none",
   active_titlebar_bg = "none",
  },
  window_background_gradient = {
   colors = { "#11111A" },
  },
  colors = {
   tab_bar = {
     inactive_tab_edge = "none",
   },
  },
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
    {
      key = 'Enter',
      mods = 'SHIFT',
      action = wezterm.action.SendString('\n')
    }
  },
}
