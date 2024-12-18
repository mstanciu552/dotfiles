awful = require("awful")

local indicator = {}

function indicator:new(args)
  return setmetatable({}, {__index = self}):init(args) 
end

function indicator:init(args)
  self.micscript = 'python3 ' .. awful.util.getdir("config") .. 'pymic/micControl.py'
  self.queryMic  = self.micscript .. ' --query'
  self.getVolume = self.micscript .. ' --get'
  self.muteMic   = self.micscript .. ' --mute'
  self.unmuteMic = self.micscript .. ' --unmute'
  self.raiseMic  = self.micscript .. ' --inc'
  self.lowerMic  = self.micscript .. ' --dec'
  
  self.widget = awful.widget.watch(self.queryMic, 1)

  self.widget.font = args.font or "UbuntuMono Nerd Font 14"

  self.widget:buttons(awful.util.table.join(
      awful.button({ }, 1, function() awful.spawn(self.muteMic, false) end),
      awful.button({ }, 3, function() awful.spawn(self.unmuteMic, false) end),
      awful.button({ }, 4, function() awful.spawn(self.raiseMic, false) end),
      awful.button({ }, 5, function() awful.spawn(self.lowerMic, false) end)
  ))

  return self
end

return setmetatable(indicator, {
  __call = indicator.new,
})
