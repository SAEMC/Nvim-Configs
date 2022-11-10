-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local scroll = require "scrollview"

local options = {
  auto_mouse = false,
  auto_workarounds = false,
  current_only = true,
  base = "left",
}

scroll.setup(options)
