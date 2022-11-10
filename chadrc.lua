-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local pluginConfs = require "custom.plugins.configs"
local M = {}

M.ui = {
  theme = "onedark",
}

M.plugins = {
  override = {
    ["NvChad/ui"] = pluginConfs.ui,
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["williamboman/mason.nvim"] = pluginConfs.mason,
  },
  user = {
    ["dstein64/nvim-scrollview"] = {
      config = function()
        require "custom.plugins.scrollview"
      end,
    },
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ["hkupty/iron.nvim"] = {
      config = function()
        require "custom.plugins.iron-nvim"
      end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.null-ls"
      end,
    },
    ["kyazdani42/nvim-tree.lua"] = {
      config = function()
        require "custom.plugins.nvimtree"
      end,
    },
    ["lewis6991/gitsigns.nvim"] = {
      config = function()
        require "custom.plugins.gitsigns"
      end,
    },
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },
    ["numToStr/Comment.nvim"] = {
      config = function()
        require "custom.plugins.comment"
      end,
    },
    ["ojroques/nvim-osc52"] = {
      config = function()
        require "custom.plugins.osc"
      end,
    },
    ["tpope/vim-surround"] = {},
  },
  remove = {},
}

M.mappings = require "custom.mappings"

return M
