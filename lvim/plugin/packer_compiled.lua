-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sc0p3/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sc0p3/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sc0p3/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sc0p3/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sc0p3/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t‚ñä Œ\3\0\0\6\1$\0J5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\5\1=\1\a\0-\1\0\0009\1\5\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\f\1=\1\15\0-\1\0\0009\1\16\1=\1\17\0-\1\0\0009\1\18\1=\1\19\0-\1\0\0009\1\18\1=\1\20\0-\1\0\0009\1\0\1=\1\21\0-\1\0\0009\1\0\1=\1\22\0-\1\0\0009\1\23\1=\1\24\0-\1\0\0009\1\23\1=\1\25\0-\1\0\0009\1\23\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0-\1\0\0009\1\0\1=\1\28\0006\1\29\0009\1\30\0019\1\31\1'\3 \0006\4\29\0009\4!\0049\4\"\4B\4\1\0028\4\4\0&\3\4\3B\1\2\1'\1#\0L\1\2\0\1¿\nÔåå  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bredS\0\0\2\0\4\0\v5\0\0\0006\1\1\0009\1\2\0019\1\3\0018\1\1\0\15\0\1\0X\2\2Ä+\1\1\0L\1\2\0+\1\2\0L\1\2\0\rfiletype\abo\bvim\1\0\2\14dashboard\2\5\2\21\0\0\1\0\1\0\2'\0\0\0L\0\2\0\n Ôëø \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ‚ñäÚ\21\1\0\v\0z\0«\0026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0029\3\5\0005\4\a\0=\4\6\0009\4\b\0035\5\15\0005\6\n\0003\a\t\0=\a\v\0064\a\3\0009\b\f\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6\16\5>\5\1\0049\4\b\0035\5\21\0005\6\18\0003\a\17\0=\a\v\0065\a\20\0009\b\19\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6\22\5>\5\2\0049\4\b\0035\5\27\0005\6\23\0009\a\24\2=\a\25\0064\a\3\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6\28\5>\5\3\0049\4\b\0035\5 \0005\6\29\0009\a\24\2=\a\25\0064\a\3\0006\b\0\0'\n\30\0B\b\2\0029\b\31\b>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6!\5>\5\4\0049\4\b\0035\5%\0005\6\"\0009\a\24\2=\a\25\0065\a$\0009\b#\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6&\5>\5\5\0049\4\b\0035\5*\0005\6'\0005\a(\0009\b\r\1>\b\2\a=\a)\0064\a\3\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6+\5>\5\6\0049\4\b\0035\5/\0005\6,\0005\a-\0009\b\r\1>\b\2\a=\a)\0065\a.\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\0060\5>\5\a\0049\4\b\0035\0052\0005\0061\0004\a\3\0009\b\19\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\0063\5>\5\b\0049\4\b\0035\0056\0005\0064\0004\a\3\0009\b5\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\0067\5>\5\t\0049\4\b\0035\5:\0005\0068\0004\a\3\0009\b9\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6;\5>\5\n\0049\4\b\0035\5=\0005\6<\0004\a\3\0009\b\f\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6>\5>\5\v\0049\4?\0035\5C\0005\6@\0003\aA\0=\a\25\0065\aB\0009\b9\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6D\5>\5\1\0049\4E\0035\5K\0005\6F\0009\aG\2=\a\25\0065\aH\0009\b\r\1>\b\2\a=\a)\0065\aJ\0009\bI\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6L\5>\5\1\0049\4E\0035\5P\0005\6M\0009\aG\2=\a\25\0065\aN\0009\b\r\1>\b\2\a=\a)\0065\aO\0009\bI\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6Q\5>\5\2\0049\4E\0035\5X\0005\6S\0003\aR\0=\a\v\0069\aT\2=\a\25\0065\aU\0009\b\r\1>\b\2\a=\a)\0065\aW\0009\bV\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6Y\5>\5\3\0049\4E\0035\5\\\0005\6Z\0009\aT\2=\a\25\0065\a[\0009\bV\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6]\5>\5\4\0049\4E\0035\5_\0005\6^\0009\aG\2=\a\25\0064\a\3\0009\bI\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6`\5>\5\5\0049\4E\0035\5c\0005\6a\0009\aG\2=\a\25\0064\a\3\0009\bb\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6d\5>\5\6\0049\4E\0035\5f\0005\6e\0009\aG\2=\a\25\0064\a\3\0009\b\19\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6g\5>\5\a\0049\4E\0035\5j\0005\6i\0003\ah\0=\a\v\0064\a\3\0009\b\f\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6k\5>\5\b\0049\4l\0035\5p\0005\6m\0005\an\0009\b\r\1>\b\2\a=\a)\0065\ao\0009\b\f\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6q\5>\5\1\0049\4l\0035\5t\0005\6r\0009\a\24\2=\a\25\0065\as\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6u\5>\5\2\0049\4v\0035\5x\0005\6w\0004\a\3\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6y\5>\5\1\0042\0\0ÄK\0\1\0\15BufferIcon\1\0\0\1\0\1\rprovider\15BufferIcon\21short_line_right\14SFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14SFileName\15BufferType\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\17FileTypeName\20short_line_left\16RainbowBlue\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\ticon\n ÔÖÜ \rprovider\15DiffRemove\17DiffModified\1\0\0\norane\1\0\2\ticon\t Ôßâ\rprovider\17DiffModified\fDiffAdd\1\0\0\1\0\2\ticon\n ÔÉæ \rprovider\fDiffAdd\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\1\4\0\0\0\0\tbold\vviolet\1\2\0\0\tNONE\24check_git_workspace\1\0\1\14separator\6 \0\15FileFormat\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\15FileFormat\15FileEncode\1\0\0\1\4\0\0\0\0\tbold\ngreen\1\2\0\0\tNONE\18hide_in_width\1\0\2\14separator\6 \rprovider\15FileEncode\nright\18ShowLspClient\1\0\0\1\4\0\0\0\0\tbold\0\1\0\2\ticon\rÔÇÖ LSP:\rprovider\17GetLspClient\bmid\19DiagnosticInfo\1\0\0\1\0\2\ticon\n ÔÅö \rprovider\19DiagnosticInfo\19DiagnosticHint\1\0\0\tcyan\1\0\2\ticon\n ÔÅ™ \rprovider\19DiagnosticHint\19DiagnosticWarn\1\0\0\vyellow\1\0\2\ticon\n ÔÅ± \rprovider\19DiagnosticWarn\20DiagnosticError\1\0\0\1\0\2\ticon\n ÔÅó \rprovider\20DiagnosticError\fPerCent\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\16LinePercent\rLineInfo\1\0\0\24separator_highlight\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\15LineColumn\rFileName\1\0\0\1\4\0\0\0\0\tbold\fmagenta\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\afg\14condition\21buffer_not_empty\1\0\1\rprovider\rFileSize\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\15RainbowRed\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\1\5\0\0\rNvimTree\nvista\tdbui\vpacker\20short_line_list\fsection\25galaxyline.condition\fdefault\21galaxyline.theme\15galaxyline\frequire\0" },
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["minimap.vim"] = {
    config = { "\27LJ\2\n†\1\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0+let g:minimap_auto_start_win_enter = 1!let g:minimap_auto_start = 1\29let g:minimap_width = 10\bcmd\bvim\0" },
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/minimap.vim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/nightfox.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.autopairs\frequire\0" },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-compe"] = {
    after = { "nvim-autopairs" },
    after_files = { "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15core.compe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\20core.lspinstall\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.nvimtree\frequire\0" },
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20core.treesitter\frequire\0" },
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.project\frequire\0" },
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.telescope\frequire\0" },
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sc0p3/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: minimap.vim
time([[Config for minimap.vim]], true)
try_loadstring("\27LJ\2\n†\1\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0+let g:minimap_auto_start_win_enter = 1!let g:minimap_auto_start = 1\29let g:minimap_width = 10\bcmd\bvim\0", "config", "minimap.vim")
time([[Config for minimap.vim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t‚ñä Œ\3\0\0\6\1$\0J5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\5\1=\1\a\0-\1\0\0009\1\5\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\f\1=\1\15\0-\1\0\0009\1\16\1=\1\17\0-\1\0\0009\1\18\1=\1\19\0-\1\0\0009\1\18\1=\1\20\0-\1\0\0009\1\0\1=\1\21\0-\1\0\0009\1\0\1=\1\22\0-\1\0\0009\1\23\1=\1\24\0-\1\0\0009\1\23\1=\1\25\0-\1\0\0009\1\23\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0-\1\0\0009\1\0\1=\1\28\0006\1\29\0009\1\30\0019\1\31\1'\3 \0006\4\29\0009\4!\0049\4\"\4B\4\1\0028\4\4\0&\3\4\3B\1\2\1'\1#\0L\1\2\0\1¿\nÔåå  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bredS\0\0\2\0\4\0\v5\0\0\0006\1\1\0009\1\2\0019\1\3\0018\1\1\0\15\0\1\0X\2\2Ä+\1\1\0L\1\2\0+\1\2\0L\1\2\0\rfiletype\abo\bvim\1\0\2\14dashboard\2\5\2\21\0\0\1\0\1\0\2'\0\0\0L\0\2\0\n Ôëø \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ‚ñäÚ\21\1\0\v\0z\0«\0026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0029\3\5\0005\4\a\0=\4\6\0009\4\b\0035\5\15\0005\6\n\0003\a\t\0=\a\v\0064\a\3\0009\b\f\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6\16\5>\5\1\0049\4\b\0035\5\21\0005\6\18\0003\a\17\0=\a\v\0065\a\20\0009\b\19\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6\22\5>\5\2\0049\4\b\0035\5\27\0005\6\23\0009\a\24\2=\a\25\0064\a\3\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6\28\5>\5\3\0049\4\b\0035\5 \0005\6\29\0009\a\24\2=\a\25\0064\a\3\0006\b\0\0'\n\30\0B\b\2\0029\b\31\b>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6!\5>\5\4\0049\4\b\0035\5%\0005\6\"\0009\a\24\2=\a\25\0065\a$\0009\b#\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6&\5>\5\5\0049\4\b\0035\5*\0005\6'\0005\a(\0009\b\r\1>\b\2\a=\a)\0064\a\3\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6+\5>\5\6\0049\4\b\0035\5/\0005\6,\0005\a-\0009\b\r\1>\b\2\a=\a)\0065\a.\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\0060\5>\5\a\0049\4\b\0035\0052\0005\0061\0004\a\3\0009\b\19\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\0063\5>\5\b\0049\4\b\0035\0056\0005\0064\0004\a\3\0009\b5\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\0067\5>\5\t\0049\4\b\0035\5:\0005\0068\0004\a\3\0009\b9\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6;\5>\5\n\0049\4\b\0035\5=\0005\6<\0004\a\3\0009\b\f\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6>\5>\5\v\0049\4?\0035\5C\0005\6@\0003\aA\0=\a\25\0065\aB\0009\b9\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6D\5>\5\1\0049\4E\0035\5K\0005\6F\0009\aG\2=\a\25\0065\aH\0009\b\r\1>\b\2\a=\a)\0065\aJ\0009\bI\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6L\5>\5\1\0049\4E\0035\5P\0005\6M\0009\aG\2=\a\25\0065\aN\0009\b\r\1>\b\2\a=\a)\0065\aO\0009\bI\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6Q\5>\5\2\0049\4E\0035\5X\0005\6S\0003\aR\0=\a\v\0069\aT\2=\a\25\0065\aU\0009\b\r\1>\b\2\a=\a)\0065\aW\0009\bV\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6Y\5>\5\3\0049\4E\0035\5\\\0005\6Z\0009\aT\2=\a\25\0065\a[\0009\bV\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6]\5>\5\4\0049\4E\0035\5_\0005\6^\0009\aG\2=\a\25\0064\a\3\0009\bI\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6`\5>\5\5\0049\4E\0035\5c\0005\6a\0009\aG\2=\a\25\0064\a\3\0009\bb\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6d\5>\5\6\0049\4E\0035\5f\0005\6e\0009\aG\2=\a\25\0064\a\3\0009\b\19\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6g\5>\5\a\0049\4E\0035\5j\0005\6i\0003\ah\0=\a\v\0064\a\3\0009\b\f\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6k\5>\5\b\0049\4l\0035\5p\0005\6m\0005\an\0009\b\r\1>\b\2\a=\a)\0065\ao\0009\b\f\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6q\5>\5\1\0049\4l\0035\5t\0005\6r\0009\a\24\2=\a\25\0065\as\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6u\5>\5\2\0049\4v\0035\5x\0005\6w\0004\a\3\0009\b\26\1>\b\1\a9\b\r\1>\b\2\a=\a\14\6=\6y\5>\5\1\0042\0\0ÄK\0\1\0\15BufferIcon\1\0\0\1\0\1\rprovider\15BufferIcon\21short_line_right\14SFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14SFileName\15BufferType\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\17FileTypeName\20short_line_left\16RainbowBlue\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\ticon\n ÔÖÜ \rprovider\15DiffRemove\17DiffModified\1\0\0\norane\1\0\2\ticon\t Ôßâ\rprovider\17DiffModified\fDiffAdd\1\0\0\1\0\2\ticon\n ÔÉæ \rprovider\fDiffAdd\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\1\4\0\0\0\0\tbold\vviolet\1\2\0\0\tNONE\24check_git_workspace\1\0\1\14separator\6 \0\15FileFormat\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\15FileFormat\15FileEncode\1\0\0\1\4\0\0\0\0\tbold\ngreen\1\2\0\0\tNONE\18hide_in_width\1\0\2\14separator\6 \rprovider\15FileEncode\nright\18ShowLspClient\1\0\0\1\4\0\0\0\0\tbold\0\1\0\2\ticon\rÔÇÖ LSP:\rprovider\17GetLspClient\bmid\19DiagnosticInfo\1\0\0\1\0\2\ticon\n ÔÅö \rprovider\19DiagnosticInfo\19DiagnosticHint\1\0\0\tcyan\1\0\2\ticon\n ÔÅ™ \rprovider\19DiagnosticHint\19DiagnosticWarn\1\0\0\vyellow\1\0\2\ticon\n ÔÅ± \rprovider\19DiagnosticWarn\20DiagnosticError\1\0\0\1\0\2\ticon\n ÔÅó \rprovider\20DiagnosticError\fPerCent\1\0\0\1\4\0\0\0\0\tbold\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\16LinePercent\rLineInfo\1\0\0\24separator_highlight\1\2\0\0\tNONE\1\0\2\14separator\6 \rprovider\15LineColumn\rFileName\1\0\0\1\4\0\0\0\0\tbold\fmagenta\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\afg\14condition\21buffer_not_empty\1\0\1\rprovider\rFileSize\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\15RainbowRed\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\1\5\0\0\rNvimTree\nvista\tdbui\vpacker\20short_line_list\fsection\25galaxyline.condition\fdefault\21galaxyline.theme\15galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-lspinstall'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'vim-vsnip', 'nvim-ts-autotag', 'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'barbar.nvim', 'dashboard-nvim', 'which-key.nvim', 'nvim-toggleterm.lua'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'friendly-snippets'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'nvim-comment', 'todo-comments.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
