-- This file can be loaded by calling `lua require('plugins')` from your init.vim
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

-- local actions = require("telescope.actions")
local plugins = {
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  dependencies = { {'nvim-lua/plenary.nvim'} },
      defaults = {
        path_display = { "truncate " },
        -- mappings = {
        --   i = {
        --     ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        --     ["<C-j>"] = actions.move_selection_next, -- move to next result
        --     ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        --   },
        -- },
      },
  },
  -- Themes
  {
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  },
  'folke/tokyonight.nvim',
  'ellisonleao/gruvbox.nvim',
  { "catppuccin/nvim", as = "catppuccin" },
  -- Misc
  'nvim-lualine/lualine.nvim',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'theprimeagen/harpoon',
  'mbbill/undotree',
  -- Git
  {
  'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
  },
  'tpope/vim-fugitive',

 {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
},

  "folke/zen-mode.nvim",
  "github/copilot.vim",

  'ThePrimeagen/vim-with-me',

  'ziglang/zig.vim',

  'ray-x/go.nvim',
  'ray-x/guihua.lua' -- recommended if need floating window support
}

local opts = {}

require("lazy").setup(plugins, opts)
