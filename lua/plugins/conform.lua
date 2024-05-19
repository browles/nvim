local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    ["*"] = {
      "trim_whitespace",
      "trim_newlines",
      -- function()
      --   local view = vim.fn.winsaveview()
      --   local endofline = [[%s/\s\+$//]]
      --   local endoffile = [[%s/\($\n\s*\)\+\%$//]]
      --   for _, pattern in ipairs({ endofline, endoffile }) do
      --     vim.cmd("keepjumps keeppatterns silent! " .. pattern)
      --   end
      --   vim.fn.winrestview(view)
      -- end,
    },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
