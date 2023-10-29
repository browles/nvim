require("plugins")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.devicons")
require("plugins.gitsigns")
require("plugins.monokai")
require("plugins.go")
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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  command = "set formatoptions-=o"
})

vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 1
vim.g.netrw_sort_by = "exten"
