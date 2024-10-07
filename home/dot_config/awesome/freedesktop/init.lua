--[[

     Awesome-Freedesktop
     Freedesktop.org compliant desktop entries and menu

     Licensed under GNU General Public License v2
      * (c) 2016,      Luke Bonham
      * (c) 2009-2015, Antonio Terceiro

--]]
local _dbus = dbus; dbus = nil
local naughty = require("naughty")
dbus = _dbus

if dbus then
    naughty.dbus = require("naughty.dbus")
end

return {
    desktop  = require("freedesktop.desktop"),
    menu     = require("freedesktop.menu")
}
