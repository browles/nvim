local fzf = require("fzf-lua")
local harpoon = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local navigator = require("Navigator")
local dap = require("dap")
local flash = require("flash")

local function autojump(cdFn)
  return function()
    vim.ui.input({ prompt = "Autojump: " }, function(input)
      if input == nil then
        return
      end
      local dir = vim.fn.system("autojump " .. input)
      dir = dir:gsub("\n", "")
      if dir ~= "." then
        vim.cmd(cdFn .. " " .. dir)
        vim.cmd.pwd()
      end
    end)
  end
end

local function toggleList(prefix)
  local flag = false
  return function()
    flag = not flag
    if flag then
      local ok, result = pcall(vim.cmd, prefix .. "open")
      if not ok then
        if prefix == "l" and result:match("No location list") then
          print("No location list")
        else
          error(result)
        end
      end
    else
      vim.cmd(prefix .. "close")
    end
  end
end

vim.g.mapleader = " "
local binds = {
  { "n", "<leader>u", ":UndotreeToggle<CR>" },
  --
  { "n", "<leader>gg", ":Git<CR>" },
  { "n", "<leader>gb", ":Git blame<CR>" },
  { "n", "<leader>gD", ":Git diff<CR>" },
  { "n", "<leader>gd", ":Gvdiffsplit!<CR>" },
  { "n", "<leader>gm", ":Git mergetool<CR>" },
  { "n", "<leader>g<", ":diffget //2<CR>" },
  { "n", "<leader>g>", ":diffget //3<CR>" },
  { "n", "<leader>gl", ":Git log --oneline<CR>" },
  { "n", "<leader>gL", ":Git log<CR>" },
  { "n", "<leader>gp", ":Git push " },
  { "n", "<leader>gP", ":Git pull " },
  { "n", "<leader>gfc", fzf.git_commits, { desc = "fzf.git_commits" } },
  { "n", "<leader>gfb", fzf.git_branches, { desc = "fzf.git_branches" } },
  { "n", "<leader>gfs", fzf.git_status, { desc = "fzf.git_status" } },
  { "n", "<leader>gft", fzf.git_stash, { desc = "fzf.git_stash" } },
  --
  { "n", "<leader>vv", ":vs | lcd ~/.config/nvim | e init.lua<CR>" },
  { "n", "<leader>vb", fzf.buffers, { desc = "fzf.buffers" } },
  { "n", "<leader>vf", fzf.oldfiles, { desc = "fzf.oldfiles" } },
  { "n", "<leader>vc", fzf.commands, { desc = "fzf.commands" } },
  { "n", "<leader>vm", fzf.marks, { desc = "fzf.marks" } },
  { "n", "<leader>vq", fzf.quickfix, { desc = "fzf.quickfix" } },
  { "n", "<leader>vl", fzf.loclist, { desc = "fzf.loclist" } },
  { "n", "<leader>vj", fzf.jumps, { desc = "fzf.jumps" } },
  { "n", "<leader>vp", fzf.registers, { desc = "fzf.registers" } },
  { "n", "<leader>vk", fzf.keymaps, { desc = "fzf.keymaps" } },
  --
  { "n", "<leader>qq", toggleList("c"), { desc = "toggleList('c')" } },
  { "n", "<leader>ql", toggleList("l"), { desc = "toggleList('l')" } },
  --
  { "n", "<leader>ff", ":NvimTreeFindFile!<CR>" },
  { "n", "<leader>fl", fzf.oldfiles, { desc = "fzf.oldfiles" } },
  { "n", "<leader>fs", ":w<CR>" },
  {
    "n",
    "<leader>fr",
    function()
      vim.ui.input({ prompt = "Rename: " }, function(input)
        if input ~= nil then
          vim.cmd("Rename " .. input)
        end
      end)
    end,
    { desc = "Rename file" },
  },
  {
    "n",
    "<leader>fd",
    function()
      local name = vim.fn.expand("%")
      vim.ui.input({ prompt = "Delete " .. name .. " ?" }, function(input)
        if input ~= nil then
          vim.cmd("Delete!")
        end
      end)
    end,
    { desc = "Delete file" },
  },
  --
  { "n", "<leader>m", harpoon.add_file, { desc = "harpoon.add_file" } },
  { "n", "<leader>h", harpoon_ui.toggle_quick_menu, { desc = "harpoon_ui.toggle_quick_menu" } },
  { "n", "<leader>j", harpoon_ui.nav_next, { desc = "harpoon_ui.nav_next" } },
  { "n", "<leader>k", harpoon_ui.nav_prev, { desc = "harpoon_ui.nav_prev" } },
  --
  { "n", "<leader>bb", ":enew<CR>" },
  { "n", "<leader>bl", fzf.buffers, { desc = "fzf.buffers" } },
  { "n", "<leader>bd", ":bdelete<CR>" },
  { "n", "<C-l>", ":bnext<CR>" },
  { "n", "<C-h>", ":bprev<CR>" },
  --
  { "n", "<leader>pe", ":NvimTreeToggle<CR>" },
  { "n", "<leader>pt", ":NvimTreeFocus<CR>" },
  { "n", "<leader>pf", fzf.files, { desc = "fzf.files" } },
  { "n", "<leader>pi", fzf.git_files, { desc = "fzf.git_files" } },
  { "n", "<leader>pg", fzf.live_grep, { desc = "fzf.live_grep" } },
  { "n", "<leader>pw", ":pwd<CR>" },
  { "n", "<leader>pc", ":cd " },
  { "n", "<leader>pj", autojump("cd"), { desc = "autojump('cd')" } },
  --
  { "n", "<leader>ww", ":vsplit<CR>" },
  { "n", "<leader>w/", ":vsplit<CR>" },
  { "n", "<leader>w-", ":split<CR>" },
  { "n", "<leader>wd", ":close<CR>" },
  { "n", "<leader>wo", ":only<CR>" },
  { "n", "<leader>wc", ":lcd " },
  { "n", "<leader>wj", autojump("lcd"), { desc = "autojump('lcd')" } },
  { "n", "<leader>tt", ":tabnew<CR>" },
  { "n", "<leader>td", ":tabclose<CR>" },
  { "n", "<leader>to", ":tabonly<CR>" },
  { "n", "<C-j>", ":tabprevious<CR>" },
  { "n", "<C-k>", ":tabnext<CR>" },
  { "n", "<leader>tc", ":tcd " },
  { "n", "<leader>tj", autojump("tcd"), { desc = "autojump('tcd')" } },
  --
  { "n", "<leader>ll", ":LspInfo<CR>" },
  { "n", "<leader>lm", ":Mason<CR>" },
  { "n", "<leader>ld", ":Trouble diagnostics toggle<CR>" },
  { "n", "<leader>li", ":LspInstall<CR>" },
  { "n", "<leader>ls", ":LspStart<CR>" },
  { "n", "<leader>lS", ":LspStop<CR>" },
  { "n", "<leader>lr", ":LspRestart<CR>" },
  --
  { "n", "<F5>", dap.continue, { desc = "dap.continue" } },
  { "n", "<F6>", dap.step_over, { desc = "dap.step_over" } },
  { "n", "<F7>", dap.step_into, { desc = "dap.step_into" } },
  { "n", "<F8>", dap.step_out, { desc = "dap.step_out" } },
  { "n", "<leader>dd", dap.continue, { desc = "dap.continue" } },
  { "n", "<leader>dD", dap.run_last, { desc = "dap.run_last" } },
  { "n", "<leader>dq", dap.terminate, { desc = "dap.terminate" } },
  { "n", "<leader>db", dap.toggle_breakpoint, { desc = "dap.toggle_breakpoint" } },
  { "n", "<leader>dB", dap.clear_breakpoints, { desc = "dap.clear_breakpoints" } },
  {
    "n",
    "<leader>dl",
    function()
      dap.list_breakpoints(true)
    end,
    { desc = "dap.list_breakpoints" },
  },
  { "n", "<leader>dr", dap.repl.open, { desc = "dap.repl.open" } },
  { "n", "<leader>dL", ":DapShowLog<CR>" },
  --
  { "n", "<leader>\\\\", ":ToggleTerm<CR>" },
  { "n", "<leader>\\a", ":ToggleTermToggleAll<CR>" },
  { "n", "<leader>\\e", ":ToggleTermSendCurrentLine<CR>" },
  { "t", "<Esc>", "<C-\\><C-n>" },
  --
  { "c", "<C-a>", "<Home>" },
  { "c", "<C-e>", "<End>" },
  { { "c", "i" }, "<C-b>", "<Left>" },
  { { "c", "i" }, "<C-f>", "<Right>" },
  { { "c", "i" }, "<C-d>", "<Delete>" },
  { { "n", "t" }, "<C-w>h", navigator.left, { desc = "navigator.left" } },
  { { "n", "t" }, "<C-w>l", navigator.right, { desc = "navigator.right" } },
  { { "n", "t" }, "<C-w>k", navigator.up, { desc = "navigator.up" } },
  { { "n", "t" }, "<C-w>j", navigator.down, { desc = "navigator.down" } },
  { { "n", "t" }, "<C-\\>", navigator.previous, { desc = "navigator.previous" } },
  { "n", "Y", "y$" },
  { { "n", "v" }, "p", "p" },
  { { "n", "v" }, "<C-p>", '"0p' },
  { "n", "<C-n>", "" },
  { "n", "<C-/>", ":nohlsearch<CR>" },
  { "n", "[q", ":cprevious<CR>" },
  { "n", "]q", ":cnext<CR>" },
  { "n", "]l", ":lnext<CR>" },
  { "n", "[l", ":lprevious<CR>" },
  { { "n", "x", "o" }, "s", flash.jump, { desc = "flash.jump" } },
  { { "n", "x", "o" }, "S", flash.treesitter, { desc = "flash.treesitter" } },
  { "o", "r", flash.remote, { desc = "flash.remote" } },
  { { "o", "x" }, "R", flash.treesitter_search, { desc = "flash.treesitter_search" } },
  { { "c" }, "<c-s>", flash.toggle, { desc = "flash.toggle" } },
  { "n", "n", "nzz" },
  { "n", "N", "Nzz" },
  { "n", "<C-u>", "<C-u>zz" },
  { "n", "<C-d>", "<C-d>zz" },
  {
    "n",
    "<C-c>",
    function()
      local cc = vim.api.nvim_get_option_value("colorcolumn", {})
      if cc == "" then
        vim.opt.colorcolumn = "+0"
      else
        vim.opt.colorcolumn = ""
      end
    end,
  },
  { "n", "<C-t>", ":TransparentToggle<CR>" },
  --
  { "n", "<F9>", ":Inspect<CR>" },
  { "n", "<F10>", ":InspectTree<CR>" },
}

for _, bind in ipairs(binds) do
  vim.keymap.set(unpack(bind))
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "checkhealth",
    "fugitive*",
    "help",
    "git",
    "notify",
    "qf",
  },
  callback = function()
    vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close the current buffer", buffer = true })
  end,
})
