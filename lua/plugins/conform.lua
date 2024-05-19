local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    ["*"] = {
      "trim_whitespace",
      "trim_newlines",
    },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
