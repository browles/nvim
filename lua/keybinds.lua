local telescope = require("telescope.builtin")
local harpoon = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.g.mapleader = " "
local binds = {
  { "n", "<leader>pe", vim.cmd.Ex },
  { "n", "<leader>pr", vim.cmd.Rex },
  { "n", "<leader>pf", telescope.find_files },
  { "n", "<leader>pi", telescope.git_files },
  { "n", "<leader>pg", telescope.live_grep },

  { "n", "<leader>m",  harpoon.add_file },
  { "n", "<C-h>",      harpoon_ui.toggle_quick_menu },
  { "n", "<C-j>",      harpoon_ui.nav_next },
  { "n", "<C-k>",      harpoon_ui.nav_prev },

  { "n", "<leader>u",  vim.cmd.UndotreeToggle },

  { "n", "<leader>gg", vim.cmd.Git },
  { "n", "<leader>ga", ":Git blame<CR>" },
  { "n", "<leader>gd", ":Git diff<CR>" },
  { "n", "<leader>gp", ":Git push" },
  { "n", "<leader>gl", ":Git pull" },
  { "n", "<leader>gc", telescope.git_commits },
  { "n", "<leader>gb", telescope.git_branches },
  { "n", "<leader>gs", telescope.git_stash },

  { "n", "<leader>vv", ":vs ~/.config/nvim | lcd ~/.config/nvim<CR>" },
  { "n", "<leader>vb", telescope.buffers },
  { "n", "<leader>vf", telescope.oldfiles },
  { "n", "<leader>vc", telescope.commands },
  { "n", "<leader>vm", telescope.marks },
  { "n", "<leader>vq", telescope.quickfix },
  { "n", "<leader>vl", telescope.loclist },
  { "n", "<leader>vj", telescope.jumplist },
  { "n", "<leader>vo", telescope.vim_options },
  { "n", "<leader>vp", telescope.registers },
  { "n", "<leader>vk", telescope.keymaps },

  { "n", "<leader>fs", ":w<CR>" },
  { "n", "<leader>fr", function()
    vim.ui.input({ prompt = "Rename: " }, function(rename)
      if rename ~= nil then
        rename = rename:match("^%s*(.-)%s*$")
        if rename ~= "" then
          vim.cmd("Rename " .. rename)
        end
      end
    end)
  end
  },
  { "n", "<leader>fd", function()
    local name = vim.fn.expand("%")
    vim.ui.input({ prompt = "Delete " .. name .. " ?" }, function(input)
      if input ~= nil then
        vim.cmd("Delete")
      end
    end)
  end
  },

  { "n",          "<leader>wh", "<C-w>h" },
  { "n",          "<leader>wj", "<C-w>j" },
  { "n",          "<leader>wk", "<C-w>k" },
  { "n",          "<leader>wl", "<C-w>l" },
  { "n",          "<leader>ww", ":vsplit<CR>" },
  { "n",          "<leader>wv", ":vsplit<CR>" },
  { "n",          "<leader>ws", ":split<CR>" },
  { "n",          "<leader>wd", ":close<CR>" },
  { "n",          "<leader>wo", ":only<CR>" },

  { "n",          "<leader>bb", ":enew<CR>" },
  { "n",          "<leader>bl", ":buffers<CR>" },
  { "n",          "<leader>bd", ":bdelete<CR>" },

  { "n",          "gb",         ":bnext<CR>" },
  { "n",          "gB",         ":bprev<CR>" },

  { "n",          "<leader>tt", ":tabnew<CR>" },
  { "n",          "<leader>td", ":tabclose<CR>" },
  { "n",          "<leader>to", ":tabonly<CR>" },

  { "c",          "<C-a>",      "<Home>" },
  { "c",          "<C-e>",      "<End>" },
  { { "c", "i" }, "<C-b>",      "<Left>" },
  { { "c", "i" }, "<C-f>",      "<Right>" },
  { { "c", "i" }, "<C-d>",      "<Delete>" },

  { "n",          "Y",          "y$" },
  { { "n", "v" }, "p",          "]p" },
  { { "n", "v" }, "<C-p>",      "\"0]p" },
  { "n",          "<C-n>",      "" },
  { "n",          "<C-/>",      ":nohlsearch<CR>" },
  { "n",          "[q",         ":cprevious<CR>" },
  { "n",          "]q",         ":cnext<CR>" },
  { "n",          "]l",         ":lnext<CR>" },
  { "n",          "[l",         ":lprevious<CR>" },
  { "n",          "n",          "nzz" },
  { "n",          "N",          "Nzz" },
  { "n",          "<C-u>",      "<C-u>zz" },
  { "n",          "<C-d>",      "<C-d>zz" },
  { "t",          "<Esc>",      "<C-\\><C-n>" },

  { "n",          "<F9>",       ":Inspect<CR>" },
  { "n",          "<F10>",      ":InspectTree<CR>" },
}

for _, bind in ipairs(binds) do
  vim.keymap.set(bind[1], bind[2], bind[3])
end
