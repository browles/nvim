-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    -- lua = { require("formatter.filetypes.lua").stylua },
    -- python = {
    -- 	require("formatter.filetypes.python").black,
    -- 	require("formatter.filetypes.python").isort,
    -- },
    -- javascript = {
    -- 	require("formatter.filetypes.javascript").prettier,
    -- 	require("formatter.filetypes.javascript").eslind_d,
    -- },
    -- css = { require("formatter.filetypes.css").prettier },
    -- ["*"] = {
    -- 	require("formatter.filetypes.any").remove_trailing_whitespace,
    -- },
  },
})
