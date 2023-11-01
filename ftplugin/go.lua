local binds = {
  { "n", "<leader>rf", ":!go run %<CR>" },

  { "n", "<leader>cr", ":GoGenReturn<CR>" },
  { "n", "<leader>ce", ":GoIfErr<CR>" },
  { "n", "<leader>cs", ":GoFillStruct<CR>" },
  { "n", "<leader>cw", ":GoFillSwitch<CR>" },

  { "n", "<leader>dd", ":GoDebug<CR>" },
  { "n", "<leader>dc", ":GoDbgConfig<CR>" },
  { "n", "<leader>db", ":GoBreakToggle<CR>" },
  { "n", "<leader>ds", ":GoDbgStop<CR>" },
  { "n", "<leader>dk", ":GoDbgKeys<CR>" },

  { "n", "<leader>Tr", ":GoTestFunc<CR>" },
  { "n", "<leader>Tf", ":GoTestFile<CR>" },
  { "n", "<leader>Tp", ":GoTestPkg<CR>" },
}

for _, bind in pairs(binds) do
  vim.keymap.set(bind[1], bind[2], bind[3])
end
