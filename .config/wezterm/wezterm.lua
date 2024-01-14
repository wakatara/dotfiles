local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximized()
end)

return {
	font = wezterm.font({
		family = "IBM Plex Mono",
	}),
	font_size = 13.5,

	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({
				family = "IBM Plex Mono",
				weight = "Bold",
				style = "Italic",
			}),
		},
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font({
				family = "IBM Plex Mono",
				weight = "Bold",
			}),
		},

		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({
				family = "IBM Plex Mono",
				weight = "Light",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({
				family = "IBM Plex Mono",
				style = "Italic",
			}),
		},
	},

	color_scheme = "Catppuccin Macchiato",
	enable_tab_bar = false,

	visual_bell = {
		fade_in_function = "EaseIn",
		fade_in_duration_ms = 150,
		fade_out_function = "EaseOut",
		fade_out_duration_ms = 150,
	},
	colors = {
		visual_bell = "#202020",
	},
}
