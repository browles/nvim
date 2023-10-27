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
  { "n",          "<leader>wl", "<C-w>l" },
  { "n",          "<leader>wv", "<C-w>v" },
  { "n",          "<leader>ws", "<C-w>s" },

  { "n",          "<leader>bd", ":bdelete<CR>" },

  { "c",          "<C-a>",      "<Home>" },
  { "c",          "<C-e>",      "<End>" },
  { { "c", "i" }, "<C-b>",      "<Left>" },
  { { "c", "i" }, "<C-f>",      "<Right>" },
  { { "c", "i" }, "<C-d>",      "<Delete>" },

  { "n",          "Y",          "y$" },
  { { "n", "v" }, "p",          "]p" },
  { { "n", "v" }, "<C-p>",      "\"0]p" },
  { "n",          "<C-n>",      "" },
  { "n",          "<leader>/",  ":nohlsearch<CR>" },
  { "t",          "<Esc>",      "<C-\\><C-n>" },

  { "n",          "n",          "nzz" },
  { "n",          "N",          "Nzz" },
  { "n",          "<C-u>",      "<C-u>zz" },
  { "n",          "<C-d>",      "<C-d>zz" },

  { "n",          "<F9>",       ":Inspect<CR>" },
}

for _, bind in pairs(binds) do
  vim.keymap.set(bind[1], bind[2], bind[3])
end
