-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "catppuccin-mocha"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.window_close_confirmation = "NeverPrompt"

config.keys = {
    -- Navigation
    { key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb" } },
    { key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"} },
}
config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
                window:perform_action(act.ClearSelection, pane)
            end
        end),
    },
    {
        event = { Down = { streak = 1, button = "Middle" } },
        mods = "NONE",
        action = wezterm.action({ PasteFrom = "Clipboard" }),
    },
}

-- and finally, return the configuration to wezterm
return config
