require("plugins.packer")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.dap")
require("plugins.treesitter")
require("plugins.devicons")
require("plugins.gitsigns")
require("plugins.monokai")
require("keybinds")

-- Disable netrw before loading nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  desc = "Remove 'o' from formatoptions.",
  pattern = "*",
  command = "set formatoptions-=o"
})

vim.api.nvim_create_autocmd({ "BufWrite" }, {
  desc = "Remove trailing whitespace and newlines.",
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    local endofline = [[%s/\s\+$//]]
    local endoffile = [[%s/\($\n\s*\)\+\%$//]]
    for _, pattern in ipairs({ endofline, endoffile }) do
      vim.cmd("keepjumps keeppatterns silent! " .. pattern)
    end
    vim.fn.winrestview(view)
  end
})

vim.api.nvim_create_autocmd("VimResized", {
  desc = "Automatically resize windows when the host window size changes.",
  pattern = "*",
  command = "wincmd =",
})
