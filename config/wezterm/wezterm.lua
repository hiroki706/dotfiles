local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Use the Japanese-capable font installed in the host's user font directory.
config.font_dirs = { wezterm.home_dir .. '/.local/share/fonts' }
config.font = wezterm.font('HackGen35 Console NF', { weight = 'Regular' })
config.font_size = 12.0

-- This Cinnamon session uses X11 and Fcitx 5.
config.enable_wayland = false
config.use_ime = true
config.xim_im_name = 'fcitx'
config.ime_preedit_rendering = 'Builtin'

local act = wezterm.action

config.keys = {
    -- 右側にペインを追加 Ctrl+Shift+D
    {
        key = 'd',
        mods = 'CTRL|SHIFT',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
}

return config
