-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- Check [ https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md ]
local servers = {
  "bashls",
  "dockerls",
  "jsonls",
  "marksman",
  "pyright",
  "rust_analyzer",
  "tsserver",
  "vimls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
