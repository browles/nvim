local lint = require("lint")

lint.linters_by_ft = {
  systemd = { "systemdlint", },
  text = { "vale", },
  markdown = { "markdownlint", },
  yaml = { "yamllint", },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  desc = "Run configured linters.",
  callback = function()
    lint.try_lint()
  end,
})
