local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Leader shortcuts for telekasten
keymap.set("n", "<leader>z", [[<cmd>lua require('telekasten').panel()<CR>]], { noremap = true, silent = true })
keymap.set("n", "<leader>zz", [[<cmd>lua require('telekasten').follow_link()<CR>]], { noremap = true, silent = true })
keymap.set(
  "n",
  "<leader>zd",
  [[<cmd>lua require('telekasten').find_daily_notes()<CR>]],
  { noremap = true, silent = true }
)
keymap.set("n", "<leader>zf", [[<cmd>lua require('telekasten').find_notes()<CR>]], { noremap = true, silent = true })
keymap.set("n", "<leader>zg", [[<cmd>lua require('telekasten').search_notes()<CR>]], { noremap = true, silent = true })
keymap.set(
  "n",
  "<leader>zb",
  [[<cmd>lua require('telekasten').show_backlinks()<CR>]],
  { noremap = true, silent = true }
)
keymap.set("n", "<leader>zt", [[<cmd>lua require('telekasten').goto_today()<CR>]], { noremap = true, silent = true })
keymap.set("n", "<leader>zc", [[<cmd>lua require('telekasten').show_calendar()<CR>]], { noremap = true, silent = true })
keymap.set("n", "<leader>zw", [[<cmd>lua require('telekasten').goto_thisweek()<CR>]], { noremap = true, silent = true })

keymap.set("n", "<leader>zw", [[<cmd>lua require('telekasten').goto_thisweek()<CR>]], { noremap = true, silent = true })

keymap.set("n", "<leader>gsj", [[<cmd> GoTagAdd json <CR>", "Add json struct tags"]], { noremap = true, silent = true })

keymap.set("n", "<leader>gsy", [[<cmd> GoTagAdd yaml <CR>", "Add yaml struct tags"]], { noremap = true, silent = true })

keymap.set("n", "<leader>gie", [[<cmd> GoIfErr <CR>", "if err != null helper"]], { noremap = true, silent = true })

keymap.set("n", "<leader>gta", [[<cmd> GoTestAll <CR>", "Go Tests creation helper"]], { noremap = true, silent = true })

keymap.set("n", "<leader>gdc", [[<cmd> GoCmt <CR>", "Go Doc comment helper"]], { noremap = true, silent = true })

keymap.set(
  "n",
  "<leader>dus",
  [[
 function()
   local widgets = require("dap.ui.widgets")
   local sidebar = widgets.sidebar(widgets.scopes)
   sidebar.open()
 end,
 "Open debugging sidebar",
  ]]
)

keymap.set(
  "n",
  "<leader>dgt",
  [[
 function()
   require("dap-go").debug_test()
 end,
 "Debug go test",
  ]]
)

keymap.set(
  "n",
  "<leader>dgl",
  [[
 function()
   require("dap-go").debug_last()
 end,
 "Debug last go test",
  ]]
)
