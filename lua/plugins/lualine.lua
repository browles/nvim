local colors = {
  black  = '#2E323C',
  grey   = '#8F908A',
  white  = '#f8f8f0',
  pink   = '#f92672',
  green  = '#a6e22e',
  aqua   = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd971f',
  purple = '#ae81ff',
  red    = '#e95678',
}

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.green, gui = 'bold' },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.white, gui = 'bold' } },
  visual = { a = { fg = colors.black, bg = colors.orange, gui = 'bold' } },
  replace = { a = { fg = colors.black, bg = colors.red, gui = 'bold' } },
  inactive = {
    a = { fg = colors.pink, bg = colors.black, gui = 'bold' },
    b = { fg = colors.white, bg = colors.red },
    c = { fg = colors.grey, bg = colors.black },
  },
}

require("lualine").setup({
  options = {
    theme = theme,
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' }
  }
})
