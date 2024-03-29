local lain = require("lain")
local dpi = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")
local awful = require("awful")
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")

local theme = {}
-- theme.wallpaper                                 = os.getenv("HOME") .. "/Pictures/wallpapers/0199.jpg"
theme.font = "Ubuntu Mono 12"
theme.fg_normal = "#BBBBBB"
theme.fg_focus = "#78A4FF"
theme.dir = os.getenv("HOME") .. "/.config/awesome/"
theme.bg_normal = "#111111"
theme.bg_focus = "#111111"
theme.fg_urgent = "#000000"
theme.bg_urgent = "#FFFFFF"
theme.border_width = dpi(1)
theme.border_normal = "#141414"
theme.border_focus = "#93B6FF"
theme.taglist_fg_focus = "#FFFFFF"
theme.taglist_bg_focus = "#5352ed"
theme.taglist_bg_normal = "#111111"
theme.titlebar_bg_normal = "#191919"
theme.titlebar_bg_focus = "#262626"
theme.menu_height = dpi(16)
theme.menu_width = dpi(130)
theme.tasklist_disable_icon = true
theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/square_unsel.png"
theme.vol = theme.dir .. "/icons/vol.png"
theme.vol_low = theme.dir .. "/icons/vol_low.png"
theme.vol_no = theme.dir .. "/icons/vol_no.png"
theme.vol_mute = theme.dir .. "/icons/vol_mute.png"
theme.disk = theme.dir .. "/icons/disk.png"
theme.cpu = theme.dir .. "/icons/cpu.png"
theme.ac = theme.dir .. "/icons/ac.png"
theme.bat = theme.dir .. "/icons/bat.png"
theme.bat_low = theme.dir .. "/icons/bat_low.png"
theme.bat_no = theme.dir .. "/icons/bat_no.png"
theme.play = theme.dir .. "/icons/play.png"
theme.pause = theme.dir .. "/icons/pause.png"
theme.stop = theme.dir .. "/icons/stop.png"
theme.layout_tile = theme.dir .. "/icons/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/fairv.png"
theme.layout_fairh = theme.dir .. "/icons/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/dwindle.png"
theme.layout_max = theme.dir .. "/icons/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.dir .. "/icons/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/floating.png"
theme.useless_gap = 5
theme.titlebar_close_button_focus = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- lain related
theme.layout_centerfair = theme.dir .. "/icons/centerfair.png"
theme.layout_termfair = theme.dir .. "/icons/termfair.png"
theme.layout_centerwork = theme.dir .. "/icons/centerwork.png"

-- notification related
theme.notification_width = dpi(400)
theme.notification_height = dpi(80)
theme.notification_font = "Ubuntu Mono 12"

-- Local theme values
local markup = lain.util.markup
local separators = lain.util.separators

-- Calendar
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
theme.cal = calendar_widget({
	theme = "nord",
	placement = "top_right",
	radius = 8,
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
	end,
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
	end,
})

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch("date +'%a %d %b, %H:%M:%S'", 1, function(widget, stdout)
	widget:set_markup(" " .. markup.font(theme.font, stdout))
end)

-- Calendar functionality
clock:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		theme.cal.toggle()
	end
end)

-- Battery
local baticon = wibox.widget.imagebox(theme.bat)
local bat = lain.widget.bat({
	settings = function()
		if bat_now.status and bat_now.status ~= "N/A" then
			if bat_now.ac_status == 1 then
				baticon:set_image(theme.ac)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
				baticon:set_image(theme.bat_no)
				os.execute("aplay ~/.config/awesome/beep-06.wav")
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
				baticon:set_image(theme.bat_low)
				-- Sound on low battery
				os.execute("aplay ~/.config/awesome/beep-06.wav")
			else
				baticon:set_image(theme.bat)
			end
			widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
		else
			widget:set_markup(markup.font(theme.bat))
			baticon:set_image(theme.ac)
		end
	end,
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.vol)
theme.volume = lain.widget.alsa({
	settings = function()
		if volume_now.status == "off" then
			volicon:set_image(theme.vol_mute)
		elseif tonumber(volume_now.level) == 0 then
			volicon:set_image(theme.vol_no)
		elseif tonumber(volume_now.level) <= 50 then
			volicon:set_image(theme.vol_low)
		else
			volicon:set_image(theme.vol)
		end

		widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
	end,
	fg = red_color,
})
theme.volume.widget:buttons(awful.util.table.join(
	awful.button({}, 4, function()
		awful.util.spawn("amixer set Master 1%+")
		theme.volume.update()
	end),
	awful.button({}, 5, function()
		awful.util.spawn("amixer set Master 1%-")
		theme.volume.update()
	end),
	awful.button({}, 1, function()
		awful.util.spawn("amixer set Master toggle")
	end)
))

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
	settings = function()
		widget:set_markup(
			markup.font(
				theme.font,
				markup("#7AC82E", " " .. string.format("%06.1f", net_now.received))
					.. " "
					.. markup("#46A8C3", " " .. string.format("%06.1f", net_now.sent) .. " ")
			)
			-- .. " " ..
			-- markup("#ffffff", " " .. string.format("%06.1f", net_now.ssid))
		)
	end,
})

local brightness = require("awesome-wm-widgets.brightness-widget.brightness")

-- Microphone control
-- local micwidget_builder = require("awmic")
local micwidget_builder = require("pymic")
micobj = micwidget_builder({})

-- Separators
local spr = wibox.widget.textbox(" | ")
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)

-- Function that returns a table with widgets
function set_widget_list(s)
	local power_bar = {
		layout = wibox.layout.fixed.horizontal,
		wibox.widget.systray(),
		arrl_ld,
		wibox.container.background(volicon, theme.bg_focus),
		wibox.container.background(theme.volume.widget, theme.bg_focus),
		arrl_dl,
		cpuicon,
		cpu.widget,
		spr,
		arrl_ld,
		wibox.container.background(tempicon, theme.bg_focus),
		wibox.container.background(temp.widget, theme.bg_focus),
		arrl_dl,
		baticon,
		bat.widget,
		spr,
		arrl_ld,
		wibox.container.background(neticon, theme.bg_focus),
		wibox.container.background(net.widget, theme.bg_focus),
		arrl_dl,
		clock,
		spr,
		arrl_ld,
		wibox.container.background(s.mylayoutbox, theme.bg_focus),
	}

	local bar_separated = {
		layout = wibox.layout.fixed.horizontal,
		wibox.widget.systray({ opacity = 0.1 }),
		spr,
		volicon,
		theme.volume.widget,
		spr,
		micobj.widget,
		spr,
		cpuicon,
		cpu.widget,
		spr,
		brightness({
			type = "icon_and_text",
			-- type = 'arc',
			program = "light",
			step = 2,
			base = 40,
			tooltip = true,
			timeout = 1,
			font = theme.font,
		}),
		spr,
		baticon,
		bat.widget,
		spr,
		clock,
		spr,
		s.mylayoutbox,
	}

	return bar_separated
end

return theme
