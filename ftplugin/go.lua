local dap_go = require("dap-go")

local binds = {
  { "n", "<leader>rf", ":!go run %<CR>" },

  { "n", "<leader>ce", ":GoIfErr<CR>" },
  { "n", "<leader>cf", ":GoFillStruct<CR>" },
  { "n", "<leader>ct", ":GoTests<CR>" },
  { "n", "<leader>cT", ":GoTestsAll<CR>" },
  { "n", "<leader>cg", ":GoAddTags " },
  { "n", "<leader>ci", ":GoImpl " },
  { "n", "<leader>cx", ":GoExtract<CR>" },

  { "n", "<leader>dt", ":GoTestFile<CR>" },
  { "n", "<leader>dT", ":GoTest<CR>" },
  { "n", "<leader>df", ":GoTestFunc<CR>" },
}

for _, bind in pairs(binds) do
  vim.keymap.set(unpack(bind))
end
