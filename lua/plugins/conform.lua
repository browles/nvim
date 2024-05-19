local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    less = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    go = { "goimports", "gofumpt" },
    lua = { "stylua" },
    python = { "isort", "black" },
    ["*"] = {
      "trim_whitespace",
      "trim_newlines",
    },
  },
  format_after_save = {
    lsp_fallback = true,
  },
})
