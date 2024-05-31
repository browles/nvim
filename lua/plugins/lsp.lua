require("neodev").setup({})
local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
  -- :help lsp-zero-keybindings
  lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
  -- Disable all semantic tokens for now
  client.server_capabilities.semanticTokensProvider = nil
end)

local lspconfig = require("lspconfig")
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
    "eslint",
    "gopls",
    "pylsp",
    "tsserver",
    -- Manually install these outside Mason
    -- "clangd",
    -- "lua_ls",
  },
  handlers = {
    lsp.default_setup,
    bashls = function()
      lspconfig["bashls"].setup({
        filetypes = { "sh", "zsh" },
      })
    end,
    gopls = function()
      lspconfig["gopls"].setup({
        settings = {
          gopls = {
            staticcheck = true,
          },
        },
      })
    end,
  },
})
lspconfig["clangd"].setup({})
lspconfig["lua_ls"].setup({
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})
