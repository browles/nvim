local actions = require("telescope.actions")
require("telescope").setup {
  pickers = {
    find_files = {
      hidden = true
    },
    git_files = {
      hidden = true
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-d>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.results_scrolling_up,
        ["<C-n>"] = actions.preview_scrolling_down,
        ["<C-p>"] = actions.preview_scrolling_up,
      },
    },
  }
}
