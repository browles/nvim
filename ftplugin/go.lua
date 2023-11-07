local dap_go = require("dap-go")

local binds = {
  { "n", "<leader>rf", ":!go run %<CR>" },

  { "n", "<leader>ce", ":GoIfErr<CR>" },
  { "n", "<leader>ct", ":GoTagAdd " },
  { "n", "<leader>ci", ":GoImpl " },
  { "n", "<leader>ct", ":GoTestAdd<CR>" },
  { "n", "<leader>cT", ":GoTestAddAll<CR>" },

  { "n", "<leader>dt", dap_go.debug_test, { desc = "dap_go.debug_test" } },
  { "n", "<leader>dT", dap_go.debug_last_test, { desc = "dap_go.debug_last_test" } },
}

for _, bind in pairs(binds) do
  vim.keymap.set(unpack(bind))
end
