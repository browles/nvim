vim.cmd([[packadd packer.nvim]])

-- local home = vim.fn.expand("$HOME")
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

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })

  use("tpope/vim-fugitive")

  use("tpope/vim-rhubarb")

  use("tpope/vim-commentary")

  use("tpope/vim-surround")

  use("tpope/vim-repeat")

  use("tpope/vim-eunuch")

  use("lewis6991/gitsigns.nvim")

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

  -- use("mfussenegger/nvim-lint")

  -- use("mhartington/formatter.nvim")

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

  use("ray-x/go.nvim")

  use("ray-x/guihua.lua")

  use("mfussenegger/nvim-dap")

  use("theHamsta/nvim-dap-virtual-text")

  use("rcarriga/nvim-dap-ui")

  use("nvim-tree/nvim-web-devicons")

  use("xiyaowong/transparent.nvim")

  use("norcalli/nvim-colorizer.lua")
end)
