-- Disable netrw immediately
-- :help nvim-tree-netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins.packer")
require("plugins.lsp")
require("plugins.lint")
require("plugins.conform")
require("plugins.cmp")
require("plugins.dap")
require("plugins.vim-go")
require("plugins.treesitter")
require("plugins.nvim_tree")
require("plugins.devicons")
require("plugins.gitsigns")
require("plugins.monokai")
require("plugins.notify")
require("keybinds")

local options = {
  termguicolors = true,
  clipboard = "unnamed",
  backup = false,
  writebackup = false,
  swapfile = false,
  fileencoding = "utf-8",

  cmdheight = 1,
  history = 1000,
  laststatus = 2,
  showmode = false,
  timeout = true,
  timeoutlen = 300,

  ignorecase = true,
  smartcase = true,
  wildignorecase = true,
  wildmode = "list:longest,full",
  completeopt = "longest,menuone",

  splitbelow = true,
  splitright = true,
  scrolloff = 10,
  sidescrolloff = 10,

  guicursor = "",
  cursorline = true,
  textwidth = 80,
  colorcolumn = "",
  list = true,
  listchars = "tab:. ,trail:.,nbsp:.,eol:$",
  wrap = false,
  mouse = "a",
  signcolumn = "yes",
  number = true,
  relativenumber = true,

  formatoptions = "jcrql",
  expandtab = true,
  smarttab = true,
  smartindent = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
vim.g.markdown_recommended_style = 0

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Remove 'o' from formatoptions.",
  pattern = "*",
  command = "set formatoptions-=o",
})

vim.api.nvim_create_autocmd("VimResized", {
  desc = "Automatically resize windows when the host window size changes.",
  pattern = "*",
  command = "wincmd =",
})
