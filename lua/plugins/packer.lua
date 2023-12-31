vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- Neovim dev
  use("folke/neodev.nvim")
  use("nvim-lua/plenary.nvim")
  use("MunifTanjim/nui.nvim")
  use("nvim-tree/nvim-web-devicons")

  -- Appearance
  use("xiyaowong/transparent.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("loctvl842/monokai-pro.nvim")
  use("lewis6991/gitsigns.nvim")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- UI Additions
  use("nvim-lualine/lualine.nvim")
  use("nvim-tree/nvim-tree.lua")
  use("ibhagwan/fzf-lua")
  use("ThePrimeagen/harpoon")
  use("mbbill/undotree")
  use({
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  })
  use("tpope/vim-fugitive")
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  })

  -- Editing/Keybinds
  use("tpope/vim-rhubarb")
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-eunuch")
  use({
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup({})
    end,
  }
  )
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- Dev
  use("olexsmir/gopher.nvim")
  use({
    "mfussenegger/nvim-dap",
    requires = {
      { "theHamsta/nvim-dap-virtual-text" },
      { "rcarriga/nvim-dap-ui" },
    }
  })
  use({
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup({})
    end
  })
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
end)
