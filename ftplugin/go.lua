local dapGo = require("dap-go")

local binds = {
  { "n", "<leader>rf", ":!go run %<CR>" },

  { "n", "<leader>dt", dapGo.debug_test },
  { "n", "<leader>dT", dapGo.debug_last_test },
}

for _, bind in pairs(binds) do
  vim.keymap.set(unpack(bind))
end
