-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "catppuccin-mocha"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10
config.window_close_confirmation = "NeverPrompt"

config.keys = {
    -- Navigation
    { key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb" } },
    { key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"} },
}

-- and finally, return the configuration to wezterm
return config
