-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- local lualine_cobalt2 = require("lualine.themes.cobalt2")

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = "catppuccin",
  },
})
