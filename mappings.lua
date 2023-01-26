-- Order:
-- <CR> / <ESC> / <Tab> / <Up/Down> / <F[1-9]> / [a-z]
-- <A-[a-z]> / <C-[a-z]> / <S-[a-z]> / <leader>[a-z]

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.disabled = {
  i = {
    -- general
    ["<CR>"] = "",
    ["<C-b>"] = "",
    ["<C-e>"] = "",
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<C-u>"] = "",
    ["<C-w>"] = "",
  },
  n = {
    -- general
    ["<ESC>"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["j"] = "",
    ["k"] = "",
    ["Y"] = "",
    ["<C-c>"] = "",
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<C-s>"] = "",
    ["<S-b>"] = "",
    ["<leader>b"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>tt"] = "",
    ["<leader>uu"] = "",

    -- blankine
    ["<leader>cc"] = "",

    -- comment
    ["<leader>/"] = "",

    -- gitsigns
    ["]c"] = "",
    ["[c"] = "",
    ["<leader>gb"] = "",
    ["<leader>ph"] = "",
    ["<leader>rh"] = "",
    ["<leader>td"] = "",

    -- lspconfig
    ["d]"] = "",
    ["[d"] = "",
    ["gD"] = "",
    ["gd"] = "",
    ["gi"] = "",
    ["gr"] = "",
    ["K"] = "",
    ["<leader>ca"] = "",
    ["<leader>D"] = "",
    ["<leader>f"] = "",
    ["<leader>fm"] = "",
    ["<leader>ls"] = "",
    ["<leader>q"] = "",
    ["<leader>ra"] = "",
    ["<leader>wa"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",

    -- nvimtree
    ["<C-n>"] = "",
    ["<leader>e"] = "",

    -- nvterm
    ["<A-h>"] = "",
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",

    -- tabufline
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<Bslash>"] = "",
    ["<leader>x"] = "",

    -- telescope
    ["<leader>cm"] = "",
    ["<leader>fa"] = "",
    ["<leader>fb"] = "",
    ["<leader>ff"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fw"] = "",
    ["<leader>gt"] = "",
    ["<leader>pt"] = "",
    ["<leader>th"] = "",
    ["<leader>tk"] = "",

    -- whichkey
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
  },
  t = {
    -- general
    ["<C-x>"] = "",

    -- nvterm
    ["<A-h>"] = "",
    ["<A-i>"] = "",
    ["<A-v>"] = "",
  },
  v = {
    -- general
    ["<Up>"] = "",
    ["<Down>"] = "",

    -- comment
    ["<leader>/"] = "",
  },
  x = {
    -- general
    ["j"] = "",
    ["k"] = "",
    ["p"] = "",
  },
}

M.abc = {
  n = {
    ["#"] = { "<Nop>", "[Disabled] Nvim builtin" },
    ["&"] = { "<Nop>", "[Disabled] Nvim builtin" },
    ["*"] = { "<Nop>", "[Disabled] Nvim builtin" },
    ["<S-y>"] = { "<Nop>", "[Disabled] Nvim builtin" },
  },
  x = {
    ["#"] = { "<Nop>", "[Disabled] Nvim builtin" },
    ["*"] = { "<Nop>", "[Disabled] Nvim builtin" },
  },
}

M.general = {
  i = {
    ["<C-d>"] = {
      'col(".") < col("$") ? "<C-o>x" : "<Esc>,<S-j>a"',
      opts = { expr = true },
      "[GENERAL] remove a character after cursor",
    },
    ["<C-h>"] = {
      "<Left>",
      "[GENERAL] move left",
    },
    ["<C-j>"] = {
      "<Down>",
      "[GENERAL] move down",
    },
    ["<C-k>"] = {
      "<Up>",
      "[GENERAL] move up",
    },
    ["<C-l>"] = {
      "<Right>",
      "[GENERAL] move right",
    },
    ["<C-u>"] = {
      "<C-G>u<C-U>",
      "[GENERAL] delete whole words before cursor",
    },
    ["<C-w>"] = {
      "<C-G>u<C-w>",
      "[GENERAL] delete a word before cursor",
    },
  },
  n = {
    ["<ESC>"] = {
      "<cmd> noh <CR>",
      "[GENERAL] no highlight",
    },
    ["<Up>"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      opts = { expr = true },
      "[GENERAL] move up through wrapped lines",
    },
    ["<Down>"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      opts = { expr = true },
      "[GENERAL] move down through wrapped lines",
    },
    ["j"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      opts = { expr = true },
      "[GENERAL] move down through wrapped lines",
    },
    ["k"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      opts = { expr = true },
      "[GENERAL] move up through wrapped lines",
    },
    ["<F12>"] = {
      "<cmd> :NvChadUpdate <CR>",
      "[GENERAL] update nvchad",
    },
    ["<C-h>"] = {
      "<C-w>h",
      "[GENERAL] window left",
    },
    ["<C-j>"] = {
      "<C-w>j",
      "[GENERAL] window down",
    },
    ["<C-k>"] = {
      "<C-w>k",
      "[GENERAL] window up",
    },
    ["<C-l>"] = {
      "<C-w>l",
      "[GENERAL] window right",
    },
    ["<leader>i"] = {
      "<cmd> w !diff % -<CR>",
      "[GENERAL] inspect differences",
    },
    ["<leader>="] = {
      "<C-w>=",
      "[GENERAL] set size of windows equally",
    },
  },
  t = {
    ["<ESC>"] = {
      termcodes "<C-\\><C-N>",
      "[GENERAL] escape terminal mode",
    },
  },
  v = {
    ["<Up>"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      opts = { expr = true },
      "[GENERAL] move up through wrapped lines",
    },
    ["<Down>"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      opts = { expr = true },
      "[GENERAL] move down through wrapped lines",
    },
  },
  x = {
    ["j"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      opts = { expr = true },
      "[GENERAL] move down through wrapped lines",
    },
    ["k"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      opts = { expr = true },
      "[GENERAL] move up through wrapped lines",
    },
    ["p"] = {
      'p:let @+=@0<CR>:let @"=@0 <CR>',
      opts = { silent = true },
      "[GENERAL] paste",
    },
  },
}

M.comment = {
  v = {
    ["<leader><leader>"] = {
      "<ESC> <cmd> lua require('Comment.api').toggle.linewise(vim.fn.visualmode()) <CR>",
      "[COMMENT] toggle comment",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    ["<leader>gd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "[GITSIGNS] check diff",
    },
    ["<leader>gh"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "[GITSIGNS] check hunk",
    },
    ["<leader>g["] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "[GITSIGNS] jump to prev hunk",
      opts = { expr = true },
    },
    ["<leader>g]"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "[GITSIGNS] jump to next hunk",
      opts = { expr = true },
    },
  },
}

M.iron = {
  n = {
    ["<leader>tc"] = {
      function()
        require("iron.core").send(nil, string.char(03))
      end,
      "[REPL] throw interruption signal (<C-c>)",
    },
    ["<leader>td"] = {
      "<cmd> lua require'iron.core'.close_repl() <CR>",
      "[REPL] throw exit signal (<C-d>)",
    },
    ["<leader>tf"] = {
      "<cmd> lua require'iron.core'.send_file() <CR>",
      "[REPL] throw file",
    },
    ["<leader>tl"] = {
      function()
        require("iron.core").send(nil, string.char(12))
      end,
      "[REPL] throw clear signal (<C-l>)",
    },
    ["<leader>tr"] = {
      "<cmd> lua require'iron.core'.repl_restart() <CR>",
      "[REPL] throw restart",
    },
  },
  v = {
    ["<leader>tt"] = {
      "<cmd> lua require'iron.core'.visual_send() <CR>",
      "[REPL] throw texts",
    },
  },
}

M.lspconfig = {
  n = {
    ["<F2>"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "[LSPCONF] rename",
    },
    ["<F5>"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "[LSPCONF] code formatting",
    },
    ["<leader>cc"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "[LSPCONF] check diagnostic",
    },
    ["<leader>cd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "[LSPCONF] check definition",
    },
    ["<leader>ch"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "[LSPCONF] check hover",
    },
    ["<leader>ci"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "[LSPCONF] check implementation",
    },
    ["<leader>cl"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "[LSPCONF] check diagnostic list",
    },
    ["<leader>cr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "[LSPCONF] check references",
    },
    ["<leader>cs"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "[LSPCONF] check signature_help",
    },
    ["<leader>ct"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "[LSPCONF] check type of definition",
    },
    ["<leader>c["] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "[LSPCONF] check diagnostic prev",
    },
    ["<leader>c]"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "[LSPCONF] check diagnostic next",
    },
  },
}

M.nvimtree = {
  n = {
    ["<leader>o"] = {
      "<cmd> NvimTreeToggle <CR>",
      "[NVIMTREE] toggle nvimtree",
    },
  },
}

M.nvterm = {
  n = {
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "[NVTERM] toggle floating term",
    },
    ["<A-s>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "[NVTERM] toggle split term",
    },
    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "[NVTERM] toggle vertical split term",
    },
  },
  t = {
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "[NVTERM] toggle floating term",
    },
    ["<A-s>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "[NVTERM] toggle split term",
    },
    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "[NVTERM] toggle vertical split term",
    },
  },
}

M.osc = {
  v = {
    ["<leader>y"] = {
      function()
        require("osc52").copy_visual()
      end,
      "[OSCYANK] yank into system clipboard",
    },
  },
}

M.surround = {
  v = {
    ["<leader>s"] = {
      "<ESC> <cmd> call SurroundCode() <CR>",
      "[SURROUND] surround selected characters",
    },
  },
}

M.tabufline = {
  n = {
    ["<leader>]"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "[TABUFLINE] goto next buffer",
    },
    ["<leader>["] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "[TABUFLINE] goto prev buffer",
    },
    ["<leader>x"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "[TABUFLINE] close buffer",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fa"] = {
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
      "[TELESCOPE] find all files",
    },
    ["<leader>ff"] = {
      "<cmd> Telescope find_files <CR>",
      "[TELESCOPE] find files",
    },
    ["<leader>fk"] = {
      "<cmd> Telescope keymaps show_plug=false <CR>",
      "[TELESCOPE] find keys",
    },
  },
}

return M
