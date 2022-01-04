local modes = require("utils.modes").modes
local globals = require "globals"

local M = {}

local function eviline()
	local lualine = require "lualine"

	local colors = {
		bg = "#202328",
		fg = "#bbc2cf",
		yellow = "#ECBE7B",
		cyan = "#008080",
		darkblue = "#081633",
		green = "#98be65",
		orange = "#FF8800",
		violet = "#a9a1e1",
		magenta = "#c678dd",
		blue = "#51afef",
		red = "#ec5f67",
		bg_dark_colors = {
			tokyonight = "#1f2335",
			monokai = "#333842",
			nightfox = "#131A24",
			kanagawa = "#2A2A37",
			onedark = "#2C323D",
		},
	}

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand "%:t") ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand "%:p:h"
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- Config
	local config = {
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			-- theme = {
			-- 	-- We are going to use lualine_c an lualine_x as left and
			-- 	-- right section. Both are highlighted by c theme .  So we
			-- 	-- are just setting default looks o statusline
			-- 	normal = { c = { fg = colors.fg, bg = colors.bg } },
			-- 	inactive = { c = { fg = colors.fg, bg = colors.bg } },
			-- },
			theme = "auto",
		},
		sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- These will be filled later
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			-- these are to remove the defaults
			lualine_a = {},
			lualine_v = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	-- Inserts a component in lualine_x ot right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left {
		function()
			return "▊"
		end,
		color = { fg = colors.blue }, -- Sets highlighting of component
		padding = { left = 0, right = 1 }, -- We don't need space before this
	}

	ins_left {
		-- mode component
		function()
			-- auto change color according to neovims mode
			local mode_color = {
				n = colors.red,
				i = colors.green,
				v = colors.blue,
				[""] = colors.blue,
				V = colors.blue,
				c = colors.magenta,
				no = colors.red,
				s = colors.orange,
				S = colors.orange,
				[""] = colors.orange,
				ic = colors.yellow,
				R = colors.violet,
				Rv = colors.violet,
				cv = colors.red,
				ce = colors.red,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.red,
				t = colors.red,
			}

			vim.api.nvim_command(
				"hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg_dark_colors[globals.colorscheme]
			)
			return "  " .. modes[vim.fn.mode()][1]
		end,
		color = "LualineMode",
		padding = { right = 1 },
	}

	-- @INFO Keyword Mode
	-- ins_left {
	-- 	"mode",
	-- 	color = "LualineMode",
	-- 	padding = { left = 1 },
	-- }

	ins_left {
		"filename",
		cond = conditions.buffer_not_empty,
		path = 1,
		color = { fg = colors.magenta, gui = "bold" },
	}

	ins_left { "location" }

	ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

	ins_left {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " " },
		diagnostics_color = {
			color_error = { fg = colors.red },
			color_warn = { fg = colors.yellow },
			color_info = { fg = colors.cyan },
		},
	}

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left {
		function()
			return "%="
		end,
	}

	ins_left {
		-- Lsp server name .
		function()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end,
		icon = " LSP:",
		color = { fg = "#ffffff", gui = "bold" },
	}

	-- Add components to right sections
	ins_right {
		"o:encoding", -- option component same as &encoding in viml
		fmt = string.upper, -- I'm not sure why it's upper case either ;)
		cond = conditions.hide_in_width,
		color = { fg = colors.green, gui = "bold" },
	}

	ins_right {
		"fileformat",
		fmt = string.upper,
		icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
		color = { fg = colors.green, gui = "bold" },
	}

	ins_right {
		"branch",
		icon = "",
		color = { fg = colors.violet, gui = "bold" },
	}

	ins_right {
		"diff",
		-- Is it me or the symbol for modified us really weird
		symbols = { added = " ", modified = "柳 ", removed = " " },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.orange },
			removed = { fg = colors.red },
		},
		cond = conditions.hide_in_width,
	}

	ins_right {
		function()
			return "▊"
		end,
		color = { fg = colors.blue },
		padding = { left = 1 },
	}

	lualine.setup(config)
end

local function bubbles()
	local colors = {
		blue = "#80a0ff",
		cyan = "#79dac8",
		black = "#080808",
		white = "#c6c6c6",
		red = "#ff5189",
		violet = "#d183e8",
		grey = "#303030",
	}

	local bubbles_theme = {
		normal = {
			a = { fg = colors.black, bg = colors.violet },
			b = { fg = colors.white, bg = colors.grey },
			c = { fg = colors.black, bg = colors.black },
		},

		insert = { a = { fg = colors.black, bg = colors.blue } },
		visual = { a = { fg = colors.black, bg = colors.cyan } },
		replace = { a = { fg = colors.black, bg = colors.red } },

		inactive = {
			a = { fg = colors.white, bg = colors.black },
			b = { fg = colors.white, bg = colors.black },
			c = { fg = colors.black, bg = colors.black },
		},
	}

	require("lualine").setup {
		options = {
			theme = bubbles_theme,
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{ "mode", separator = { left = "" }, right_padding = 2 },
			},
			lualine_b = { "filename", "branch" },
			lualine_c = { "fileformat" },
			lualine_x = {},
			lualine_y = { "filetype", "progress" },
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {},
	}
end

function M.config()
	eviline()
end

return M
