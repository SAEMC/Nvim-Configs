-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

require("base46").load_highlight "nvimtree"

local options = {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = { "alpha" },
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
    mappings = {
      custom_only = true,
      list = {
        { key = "<CR>", action = "edit" },
        { key = "<ESC>", action = "close_node" },
        { key = "<TAB>", action = "cd" },
        { key = "<F1>", action = "toggle_help" },
        { key = "<F2>", action = "rename" },
        { key = "<S-TAB>", action = "dir_up" },
        { key = "<leader>a", action = "create" },
        { key = "<leader>c", action = "copy" },
        { key = "<leader>d", action = "remove" },
        { key = "<leader>m", action = "rename" },
        { key = "<leader>p", action = "paste" },
        { key = "<leader>r", action = "refresh" },
        { key = "<leader>s", action = "split" },
        { key = "<leader>v", action = "vsplit" },
        { key = "<leader>x", action = "cut" },
        { key = "<leader>y", action = "copy_absolute_path" },
      },
    },
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

options = require("core.utils").load_override(options, "kyazdani42/nvim-tree.lua")
vim.g.nvimtree_side = options.view.side

nvimtree.setup(options)
