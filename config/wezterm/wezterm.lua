local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("HackGen35 Console NF", { weight = "Regular" })
config.font_size = 11.0

local act = wezterm.action
config.keys = {
	-- 右側にペインを追加 Ctrl+Shift+D
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- ペインフォーカス移動 Ctrl+Shift+矢印
}

return config
