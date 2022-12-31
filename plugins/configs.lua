-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local M = {}

M.ui = {
  statusline = {
    separator_style = "arrow",
  },
  tabufline = {
    lazyload = false,
  },
}

-- Check [ $ nvim +Mason ]
M.mason = {
  ensure_installed = {
    -- LSP
    "bash-language-server",
    "dockerfile-language-server",
    "json-lsp",
    "lua-language-server",
    "marksman",
    "pyright",
    "rust-analyzer",
    "typescript-language-server",
    "vim-language-server",
    "yaml-language-server",

    -- Linter/Formatter
    "black",
    "fixjson",
    "markdownlint",
    "prettier",
    "rustfmt",
    "shfmt",
    "stylua",
  },
}

-- Check [ https://github.com/nvim-treesitter/nvim-treesitter ]
M.treesitter = {
  ensure_installed = {
    "bash",
    "dockerfile",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "typescript",
    "vim",
    "yaml",
  },
}

return M
