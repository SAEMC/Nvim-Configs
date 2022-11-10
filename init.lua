-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

-- [ Autocmds ]
-- Set nvim-tree.lua auto-close
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
  nested = true,
})
-- Set terminal window equally
vim.api.nvim_create_autocmd(
  { "BufLeave" },
  { pattern = "*", command = [[if &buftype == 'terminal' | :set nowfw | endif]] }
)
-- Remember cursor position of previous buffer
vim.api.nvim_create_autocmd(
  { "BufRead" },
  { pattern = "*", command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "norm g`\"" | endif]] }
)
-- Ignore auto-comment below a commented line
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "*", command = [[silent set formatoptions-=cro]] })
-- Set cursor shape and highlight cursorline
-- [ n ]: Normal mode
-- [ v ]: Visual mode / [ ve ]: Visual mode with selection
-- [ o ]: Operator-pending mode
-- [ i ]: Insert mode
-- [ r ]: Replace mode
-- [ c ]: CL Normal mode / [ ci ]: CL Insert mode / [ cr ]: CL Replace mode
-- [ sm ]: showmatch in Insert mode
-- [ a ]: all modes
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  pattern = "*",
  command = [[silent set guicursor=n-v-ve-o-r-c-cr-sm:hor1,i-ci:ver1 | :highlight CursorLine guibg=#353b45]],
})
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, { pattern = "*", command = [[silent set guicursor=a:block]] })

-- [ Functions ]
-- Catch vmap info of vim-surround command for custom mapping - Vimscript style
vim.cmd [[
  function! SurroundCode()
    let msg = execute(':verbose vmap <Plug>VSurround')
    silent call eval(printf(matchstr(msg, '<SNR>.*0)')))
  endfunction
]]

-- [ Options ]
-- Set UTF-8 encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- Ignore mouse click - override NvChad's default option
vim.opt.mouse:remove "a"
-- Set LuaSnip path
vim.g.luasnippets_path = "~/.config/nvim/lua/custom/snippets"
-- Ignore default mappings of vim-surround
vim.g.surround_no_mappings = 1
