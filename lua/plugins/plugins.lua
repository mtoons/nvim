-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  "HUAHUAI23/telescope-session.nvim",

  {
    "LunarVim/bigfile.nvim",
    opts = {
    },
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    config = function()
      require("rust-tools").setup({})
    end
  },-- Lua

  -- {
  --   "folke/trouble.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   opts = {
  --   },
  -- },

--[[   {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  }, ]]

  {
    "folke/zen-mode.nvim",
    opts = {window = {width = 175,},}
  },

  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({})
    end,
  },

  -- {
  --   'akinsho/toggleterm.nvim',
  --   version = "*",
  --   opts = {
  --     open_mapping = [[<c-t>]],
  --     winbar = { enabled = true }
  --   },
  -- },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- {
  --   "Mythos-404/xmake.nvim",
  --   -- branch = "v1",
  --   lazy = true,
  --   event = "BufReadPost xmake.lua",
  --   config = true,
  --   opts = {
  --     compile_command = { -- compile_command file generation configuration
  --       dir = "build",    -- location of the generated file
  --     },
  --   },
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  -- },

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
