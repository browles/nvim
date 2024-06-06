require("nvim-tree").setup({
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
      ignore_list = { "git", "gitcommit", "gitrebase" },
    },
  },
})
