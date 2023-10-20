local lsp = require("lsp-zero")

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
  lsp.buffer_autoformat()
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "tsserver",
    "eslint",
    "pylsp",
    "gopls",
    "lua_ls",
  },
  handlers = {
    lsp.default_setup,
  },
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})
