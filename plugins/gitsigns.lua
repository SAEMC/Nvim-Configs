-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

require("base46").load_highlight "git"

local options = {
  signs = {
    add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr" },
    change = { hl = "GitSignsChange", text = "*", numhl = "GitSignsChangeNr" },
    changedelete = { hl = "GitSignsChange", text = "*", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr" },
    untracked = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr" },
  },
  numhl = true,
  current_line_blame = true,
  on_attach = function(bufnr)
    require("core.utils").load_mappings("gitsigns", { buffer = bufnr })
  end,
}

options = require("core.utils").load_override(options, "lewis6991/gitsigns.nvim")
gitsigns.setup(options)
