local dap_go = require("dap-go")

local binds = {
  { "n", "<leader>rr", ":GoRun<CR>" },
  { "n", "<leader>rt", ":GoTestFile<CR>" },
  { "n", "<leader>rT", ":GoTest<CR>" },
  { "n", "<leader>rf", ":GoTestFunc<CR>" },
  { "n", "<leader>rc", ":GoCoverage<CR>" },
  { "n", "<leader>rC", ":GoCoverageClear<CR>" },

  { "n", "<leader>ce", ":GoIfErr<CR>" },
  { "n", "<leader>cf", ":GoFillStruct<CR>" },
  { "n", "<leader>ct", ":GoTests<CR>" },
  { "n", "<leader>cT", ":GoTestsAll<CR>" },
  { "n", "<leader>cg", ":GoAddTags " },
  { "n", "<leader>ci", ":GoImpl " },
  { "n", "<leader>cx", ":GoExtract<CR>" },
  { "n", "<leader>cj", 'j0w"jdwc0<BS>; <ESC>^"jP<CR>', { desc = "Join iferr" } },
  { "n", "<leader>cE", "<leader>ce4k<leader>cj", { remap = true, desc = "Inline iferr" } },

  { "n", "<leader>dt", dap_go.debug_test, { desc = "dap.run_test" } },
  { "n", "<leader>dT", dap_go.debug_last_test, { desc = "dap.run_last_test" } },
}

for _, bind in pairs(binds) do
  vim.keymap.set(unpack(bind))
end
