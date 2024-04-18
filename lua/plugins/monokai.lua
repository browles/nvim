vim.opt.termguicolors = true
require("colorizer").setup({ "lua" })

require("monokai-pro").setup({
  filter = "pro",
  devicons = true,
  background_clear = {
    "telescope",
  },
})
vim.cmd([[colorscheme monokai-pro]])
-- vim.cmd([[TransparentEnable]])

-- green #a9dc76
-- dark #19181a
-- red #ff6188
-- dimmed5 #403e41
-- dimmed4 #5b595c
-- dimmed3 #727072
-- blue #fc9867
-- dimmed2 #939293
-- magenta #ab9df2
-- yellow #ffd866
-- black #221f22
-- cyan #78dce8
-- dimmed1 #c1c0c0
-- white #fcfcfa

local colors = require("monokai-pro.colorscheme").get("pro")
local lualine_theme = {
  normal = {
    a = { bg = colors.base.green, fg = colors.base.black, gui = "bold" },
    b = { bg = colors.base.dimmed5, fg = colors.base.green },
    c = {
      bg = colors.statusBar.background,
      fg = colors.statusBar.activeForeground,
    },
    x = {
      bg = colors.statusBar.background,
      fg = colors.statusBar.activeForeground,
    },
  },
  insert = {
    a = { bg = colors.base.yellow, fg = colors.base.black, gui = "bold" },
    b = { bg = colors.base.dimmed5, fg = colors.base.yellow },
  },
  command = {
    a = { bg = colors.base.green, fg = colors.base.black, gui = "bold" },
    b = { bg = colors.base.dimmed5, fg = colors.base.green },
  },
  visual = {
    a = { bg = colors.base.magenta, fg = colors.base.black, gui = "bold" },
    b = { bg = colors.base.dimmed5, fg = colors.base.magenta },
  },
  replace = {
    a = { bg = colors.base.red, fg = colors.base.black, gui = "bold" },
    b = { bg = colors.base.dimmed5, fg = colors.base.red },
  },
  inactive = {
    a = { bg = colors.base.black, fg = colors.base.yellow },
    b = { bg = colors.base.black, fg = colors.base.black },
  },
}

require("lualine").setup({
  extensions = {
    "fugitive",
    "fzf",
    "mason",
    "nvim-dap-ui",
    "nvim-tree",
    "quickfix",
    "toggleterm",
  },
  options = {
    theme = lualine_theme,
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' }
  },
  sections = {
    lualine_c = {
      {
        "filename",
        path = 1
      }
    }
  },
  inactive_sections = {
    lualine_c = {
      {
        "filename",
        path = 1
      }
    }
  }
})

vim.api.nvim_set_hl(0, "@symbol", { fg = colors.base.magenta })
vim.api.nvim_set_hl(0, "@keyword", { fg = colors.base.red })
vim.api.nvim_set_hl(0, "@type", { fg = colors.base.cyan })
vim.api.nvim_set_hl(0, "Typedef", { fg = colors.base.cyan })
vim.api.nvim_set_hl(0, "@field", { fg = colors.base.white })
