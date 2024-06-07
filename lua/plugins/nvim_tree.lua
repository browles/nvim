local ignore = { "git", "gitcommit", "gitrebase", "help" }
require("nvim-tree").setup({
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
      ignore_list = ignore,
    },
    exclude = function(event)
      return vim.tbl_contains(ignore, vim.bo[event.buf].filetype)
    end,
  },
})
