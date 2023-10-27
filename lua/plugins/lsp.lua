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
    -- Misc
    "html",
    "cssls",
    "sqlls",
    -- Configs
    "jsonls",
    "taplo",
    "yamlls",
    "dockerls",
    -- Languages
    "bashls",
    "clangd",
    "eslint",
    "gopls",
    "lua_ls",
    "pylsp",
    "tsserver",
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
lspconfig.bashls.setup({
  filetypes = { "sh", "zsh" }
})
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
