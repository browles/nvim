local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
  mapping = {
    -- Navigate between completion item
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),

    -- toggle completion
    ["<C-u>"] = cmp_action.toggle_completion({}),

    -- navigate between snippet placeholder
    ["<C-a>"] = cmp_action.luasnip_jump_backward(),
    ["<C-d>"] = cmp_action.luasnip_jump_forward(),

    -- Confirm item
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  },
})
