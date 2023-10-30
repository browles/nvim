local fzf = require("fzf-lua")
local harpoon = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local navigator = require("Navigator")

local function autojump(cdFn)
  return function()
    vim.ui.input({ prompt = "Autojump: " }, function(input)
      if input == nil then
        return
      end
      local dir = vim.fn.system("autojump " .. input)
      dir = dir:gsub("\n", "")
      if dir ~= '.' then
        vim.cmd(cdFn .. " " .. dir)
        vim.cmd.pwd()
      end
    end)
  end
end

vim.g.mapleader = " "
local binds = {
  { "n", "<leader>pe", ":NvimTreeToggle<CR>" },
  { "n", "<leader>pf", fzf.files },
  { "n", "<leader>pi", fzf.git_files },
  { "n", "<leader>pg", fzf.live_grep },
  { "n", "<leader>pw", vim.cmd.pwd },
  { "n", "<leader>pc", ":cd " },
  { "n", "<leader>pj", autojump("cd") },

  { "n", "<leader>m",  harpoon.add_file },
  { "n", "<C-h>",      harpoon_ui.toggle_quick_menu },
  { "n", "<C-j>",      harpoon_ui.nav_next },
  { "n", "<C-k>",      harpoon_ui.nav_prev },

  { "n", "<leader>u",  vim.cmd.UndotreeToggle },

  { "n", "<leader>gg", vim.cmd.Git },
  { "n", "<leader>ga", ":Git blame<CR>" },
  { "n", "<leader>gd", ":Git diff<CR>" },
  { "n", "<leader>gp", ":Git push " },
  { "n", "<leader>gl", ":Git pull " },
  { "n", "<leader>gc", fzf.git_commits },
  { "n", "<leader>gb", fzf.git_branches },
  { "n", "<leader>gs", fzf.git_stash },

  { "n", "<leader>vv", ":vs | lcd ~/.config/nvim | e init.lua<CR>" },
  { "n", "<leader>vb", fzf.buffers },
  { "n", "<leader>vf", fzf.oldfiles },
  { "n", "<leader>vc", fzf.commands },
  { "n", "<leader>vm", fzf.marks },
  { "n", "<leader>vq", fzf.quickfix },
  { "n", "<leader>vl", fzf.loclist },
  { "n", "<leader>vj", fzf.jumps },
  { "n", "<leader>vp", fzf.registers },
  { "n", "<leader>vk", fzf.keymaps },

  { "n", "<leader>ff", ":NvimTreeFindFile<CR>" },
  { "n", "<leader>fl", fzf.oldfiles },
  { "n", "<leader>fs", ":w<CR>" },
  { "n", "<leader>fr", function()
    vim.ui.input({ prompt = "Rename: " }, function(input)
      if input ~= nil then
        vim.cmd("Rename " .. input)
      end
    end)
  end },
  { "n", "<leader>fd", function()
    local name = vim.fn.expand("%")
    vim.ui.input({ prompt = "Delete " .. name .. " ?" }, function(input)
      if input ~= nil then
        vim.cmd("Delete!")
      end
    end)
  end },

  { "n",          "<leader>ww", ":vsplit<CR>" },
  { "n",          "<leader>w/", ":vsplit<CR>" },
  { "n",          "<leader>w-", ":split<CR>" },
  { "n",          "<leader>wd", ":close<CR>" },
  { "n",          "<leader>wo", ":only<CR>" },
  { "n",          "<leader>wc", ":lcd " },
  { "n",          "<leader>wi", autojump("lcd") },

  { "n",          "<leader>bb", ":enew<CR>" },
  { "n",          "<leader>bl", fzf.buffers },
  { "n",          "<leader>bd", ":bdelete<CR>" },
  { "n",          "gb",         ":bnext<CR>" },
  { "n",          "gB",         ":bprev<CR>" },

  { "n",          "<leader>tt", ":tabnew<CR>" },
  { "n",          "<leader>td", ":tabclose<CR>" },
  { "n",          "<leader>to", ":tabonly<CR>" },
  { "n",          "<leader>tc", ":tcd " },
  { "n",          "<leader>tj", autojump("tcd") },

  { "c",          "<C-a>",      "<Home>" },
  { "c",          "<C-e>",      "<End>" },
  { { "c", "i" }, "<C-b>",      "<Left>" },
  { { "c", "i" }, "<C-f>",      "<Right>" },
  { { "c", "i" }, "<C-d>",      "<Delete>" },

  { "n",          "<C-w>h",     navigator.left },
  { "n",          "<C-w>l",     navigator.right },
  { "n",          "<C-w>k",     navigator.up },
  { "n",          "<C-w>j",     navigator.down },
  { "n",          "<C-\\>",     navigator.previous },

  { "n",          "Y",          "y$" },
  { { "n", "v" }, "p",          "p" },
  { { "n", "v" }, "<C-p>",      "\"0p" },
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
  { "n", "<C-c>", function()
    local cc = vim.api.nvim_get_option_value("colorcolumn", {})
    if cc == "" then
      vim.opt.colorcolumn = "+0"
    else
      vim.opt.colorcolumn = ""
    end
  end },
  { "n", "<C-t>", ":TransparentToggle<CR>" },
  { "t", "<Esc>", "<C-\\><C-n>" },

  { "n", "<F9>",  ":Inspect<CR>" },
  { "n", "<F10>", ":InspectTree<CR>" },
}

for _, bind in ipairs(binds) do
  vim.keymap.set(bind[1], bind[2], bind[3])
end
