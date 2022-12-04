require("brehen.base")
require("brehen.highlights")
require("brehen.maps")
require("brehen.plugins")

local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
  require("brehen.macos")
end
if is_win then
  require("brehen.windows")
end
