local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy requires setting up mapping of leader before loading
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Package manager
require("lazy").setup({

  -- add list of plugins to install

  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  -- { "lalitmee/cobalt2.nvim", dependencies = "tjdevries/colorbuddy.nvim" },
  -- 'bluz71/vim-nightfly-guicolors', -- preferred colorscheme
  { "catppuccin/nvim", name = "catppuccin" },

  { "NTBBloodbath/sweetie.nvim" },

  "christoomey/vim-tmux-navigator", -- tmux & split window navigation

  "szw/vim-maximizer", -- maximizes and restores current window

  -- essential plugins
  "tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  "numToStr/Comment.nvim",

  -- file explorer
  "nvim-tree/nvim-tree.lua",

  -- vs-code like icons
  "nvim-tree/nvim-web-devicons",

  -- statusline
  "nvim-lualine/lualine.nvim",

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder
  { "renerocksai/telekasten.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },

  -- ChatGPT plugin
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- config = function()
    --   require("chatgpt").setup({
    --     api_key_cmd = "gopass show -o apis/chatgpt/nvim",
    --   })
    -- end,
  },

  -- autocompletion
  "hrsh7th/nvim-cmp", -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path", -- source for file system paths

  -- Handy Go boilerplate helpers
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd([[silent! GoInstallDeps]])
    end,
  },

  -- Delve debugger
  "mfussenegger/nvim-dap",
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },

  -- Spelling with Code Actions, since I suck
  { "davidmh/cspell.nvim" },

  -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "saadparwaiz1/cmp_luasnip", -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
  "hrsh7th/cmp-nvim-lsp", -- for autocompletion

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)

  "onsails/lspkind.nvim", -- vs-code like icons for autocompletion

  -- formatting & linting
  "nvimtools/none-ls.nvim",
  -- "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag", --autoclose tags
    },
  },

  -- auto closing
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

  -- git integration
  "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
})
