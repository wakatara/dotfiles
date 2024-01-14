local present, catppuccin = pcall(require, "catppuccin")
if not present then
  return
end

vim.opt.termguicolors = true

catppuccin.setup({
  flavour = "macchiato",
  term_colors = true,
  transparent_background = false,
  no_italic = false,
  no_bold = false,
  styles = {
    comments = { "italic" },
    conditionals = {},
    loops = {},
    functions = { "italic" },
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = { "bold" },
  },
  -- color_overrides = {
  -- mocha = {
  --   base = "#171717", -- background
  --   surface2 = "#9A9A9A", -- comments
  --   text = "#F6F6F6",
  -- },
  -- },
  highlight_overrides = {
    mocha = function(C)
      return {
        NvimTreeNormal = { bg = C.none },
        CmpBorder = { fg = C.surface2 },
        Pmenu = { bg = C.none },
        NormalFloat = { bg = C.none },
        TelescopeBorder = { link = "FloatBorder" },
      }
    end,
  },
})

vim.cmd.colorscheme("catppuccin")

-- set colorscheme to catppuccin with protected call
-- in case it isn't installed
-- local status, _ = pcall(vim.cmd, "colorscheme catpuccin")
-- if not status then
--   print("Colorscheme not found!") -- print error if colorscheme not installed
--   return
-- end

-- require("colorbuddy").colorscheme("cobalt2")
-- require("catppuccin")
--

-- vim.cmd.colorscheme("sweetie")
-- vim.cmd.colorscheme("catppuccin-macchiato")
-- vim.g.catppuccin_flavour = "macchiato"
-- catppuccin.setup()
-- vim.cmd [[colorscheme catppuccin]]

-- vim.g,colorscheme("catppuccin")
