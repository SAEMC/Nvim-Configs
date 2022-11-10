-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local osc = require "osc52"

local options = {
  max_length = 0,
  silent = false,
  trim = false,
}

osc.setup(options)
