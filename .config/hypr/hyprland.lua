-- Home desktop monitor
hl.monitor({
    output = "desc:AOC AG326UD 10PRAJA000382",
    mode = "3840x2160@165",
    position = "auto",
    scale = "1.5",
})

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- Variables
local terminal = "ghostty"
local menu = "rofi -show drun"
local screenshot = "slurp | grim -g - - | wl-copy"
local mainMod = "SUPER"
local wallpaper = "hyprpaper"
local bar = "waybar"
local notifications = "dunst"

-- Start up execution
hl.on("hyprland.start", function()
    hl.exec_cmd(wallpaper)
    hl.exec_cmd(bar)
    hl.exec_cmd(notifications)
end)

-- Environment variables
hl.env("XCURSOR_SIZE", "28")
hl.env("HYPRCURSOR_SIZE", "28")

-- Appearance
hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        col = {
            active_border = "rgba(ffffffff)",
            inactive_border = "rgb(000000)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 0,
    },
    animations = { enabled = false },
    dwindle = { preserve_split = true },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
})

-- Input
hl.config({
    input = {
        kb_layout = "se",
        touchpad = { natural_scroll = true },
    },
    xwayland = { force_zero_scaling = true },
})

-- Interaction
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Program execution
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SHIFT + ALT + l", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(
    "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(screenshot))

-- Focus and window moving
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "down" }))

-- Workspace switching and moving
for workspace = 1, 10 do
    local key = workspace % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
