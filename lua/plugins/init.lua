-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    config = function()
      require("rust-tools").setup({})
    end
  },

  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({})
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-t>]],
        winbar = { enabled = true }
      }
    end
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "Mythos-404/xmake.nvim",
    -- branch = "v1",
    lazy = true,
    event = "BufReadPost xmake.lua",
    config = true,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        mappings = {
          ["<space>"] = { "open", nowait = false, }
        },
      },
    }
  },
}
