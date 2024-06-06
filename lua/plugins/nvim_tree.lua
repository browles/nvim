require("nvim-tree").setup({
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
      ignore_list = { "git", "gitcommit", "gitrebase" },
    },
    exclude = function(event)
      local ignore = { "git", "gitcommit", "gitrebase" }
      return vim.tbl_contains(ignore, vim.bo[event.buf].filetype)
    end,
  },
})
