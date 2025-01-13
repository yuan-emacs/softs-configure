-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Ayu Light (Gogh)'
-- config.color_scheme = "zenbones"
config.color_scheme = "xcodedarkhc"

config.font = wezterm.font("SFMono Nerd Font", { weight = "Bold" })

config.font_size = 17.3

-- 配置 rzsz 相关的 key mappings（这里只是示例，你可以按需调整）
config.keys = {
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wezterm.action({
			SpawnCommandInNewTab = {
				args = { "/usr/local/bin/rz" },
			},
		}),
	},
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = wezterm.action({
			SpawnCommandInNewTab = {
				args = { "/usr/local/bin/sz" },
			},
		}),
	},
}

config.set_environment_variables = {
	TERM = "xterm-256color",
}

-- and finally, return the configuration to wezterm
return config
