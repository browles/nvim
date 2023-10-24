vim.cmd([[packadd packer.nvim]])

local home = vim.fn.expand("$HOME")
return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    -- or                            , branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use("tanvirtin/monokai.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  use("ThePrimeagen/harpoon")

  use("mbbill/undotree")

  use("itchyny/lightline.vim")

  use("tpope/vim-fugitive")

  use("tpope/vim-commentary")

  use("airblade/vim-gitgutter")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- LSP Support
      { "neovim/nvim-lspconfig" },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
  })

  use("mfussenegger/nvim-lint")

  use("mhartington/formatter.nvim")

  use("folke/neodev.nvim")

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- use({
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup({
  --       api_key_cmd = "cat " .. home .. "/.openai_key"
  --     })
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- })

  use "ray-x/go.nvim"

  use 'mfussenegger/nvim-dap'
end)
