local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- OS detection
local is_windows = wezterm.target_triple:find("windows") ~= nil
local is_mac = wezterm.target_triple:find("apple") ~= nil

if is_windows then
	-- Prefer Git's launcher on Windows (often more reliable than bash.exe directly)
	config.default_prog = { "C:\\Program Files\\Git\\git-bash.exe" }

	-- Optional: explicit launch menu entry so you can test it manually
	config.launch_menu = {
		{
			label = "Git Bash",
			args = { "C:\\Program Files\\Git\\git-bash.exe" },
		},
	}
elseif is_mac then
	config.default_prog = { "/bin/zsh", "-l" }
end

-- Font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.0

-- Appearance
config.color_scheme = "Catppuccin Mocha"
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
config.debug_key_events = true

config.keys = {
	{ key = "q", mods = "ALT", action = wezterm.action.QuitApplication },
}

return config
