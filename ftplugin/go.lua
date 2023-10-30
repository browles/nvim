local binds = {
  { "n", "<F5>",       ":!go run %<CR>" },

  { "n", "<leader>cr", ":GoGenReturn<CR>" },
  { "n", "<leader>ce", ":GoIfErr<CR>" },
  { "n", "<leader>cs", ":GoFillStruct<CR>" },
  { "n", "<leader>cw", ":GoFillSwitch<CR>" },

  { "n", "<leader>dd", ":GoDebug<CR>" },
  { "n", "<leader>dc", ":GoDbgConfig<CR>" },
  { "n", "<leader>db", ":GoBreakToggle<CR>" },
  { "n", "<leader>ds", ":GoDbgStop<CR>" },
  { "n", "<leader>dk", ":GoDbgKeys<CR>" },

  { "n", "<leader>rr", ":GoTestFunc<CR>" },
  { "n", "<leader>rf", ":GoTestFile<CR>" },
  { "n", "<leader>rp", ":GoTestPkg<CR>" },
}

for _, bind in pairs(binds) do
  vim.keymap.set(bind[1], bind[2], bind[3])
end
