-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local load_override = require("core.utils").load_override
local present, nvim_comment = pcall(require, "Comment")

if not present then
  return
end

local options = {
  ignore = "^$",
  mappings = {
    basic = false,
    extra = false,
    extended = false,
  },
}
options = load_override(options, "numToStr/Comment.nvim")
nvim_comment.setup(options)
