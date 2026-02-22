local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- OS detection
local is_windows = wezterm.target_triple:find('windows') ~= nil
local is_mac = wezterm.target_triple:find('apple') ~= nil

-- Shell based on OS
if is_windows then
  config.default_prog = { 'cmd.exe' }
elseif is_mac then
  config.default_prog = { '/bin/zsh', '-l' }
end

-- Font
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 13.0

-- Appearance
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 1.0
config.hide_tab_bar_if_only_one_tab = true

-- Window
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

config.window_decorations = "RESIZE"
config.initial_cols = 220
config.initial_rows = 50

-- Performance
config.max_fps = 240

return config