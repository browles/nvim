local notify = require("notify")
vim.notify = notify

notify.setup({
  fps = 30,
  render = "wrapped-compact",
  stages = "fade",
  timeout = 3000,
})
