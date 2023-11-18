-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  "HUAHUAI23/telescope-session.nvim",
  "rcarriga/nvim-notify",
  "onsails/lspkind.nvim",
  "hrsh7th/cmp-calc",
  "lervag/vimtex",

  {
    'zadirion/Unreal.nvim',
    dependencies = { "tpope/vim-dispatch" },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        ██╔██╗ ██║██████╗ ██║   ██║██║   ██║██║██╔████╔██║
        ██║╚██╗██║██╔═══╝ ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = 'Telescope xray23 list', desc = " Session", icon = " ", key = "s" },
            { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
            { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
            { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
            { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
            {
              action = [[lua require("lazyvim.util").telescope.config_files()()]],
              desc = " Config",
              icon = " ",
              key = "c"
            },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },

  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      width = 130,
    }
  },

  {
    'smoka7/hop.nvim',
    version = "*",
    config = function()
      require 'hop'.setup { keys = 'qsdfghjklmazertyuiopwxcvbn' }
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f',
        function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end,
        { remap = true })
      vim.keymap.set('', 'F',
        function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end,
        { remap = true })
      vim.keymap.set('', 't',
        function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end,
        { remap = true })
      vim.keymap.set('', 'T',
        function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end,
        { remap = true })
      vim.keymap.set('', '<leader>hc',
        function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false }) end,
        { remap = true, desc = '[H]op [C]haracter' })
      vim.keymap.set('', '<leader>hC',
        function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end,
        { remap = true, desc = '[H]op [C]haracter' })
      vim.keymap.set('', '<leader>hw',
        function() hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false }) end,
        { remap = true, desc = '[H]op [W]ords' })
      vim.keymap.set('', '<leader>hW',
        function() hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end,
        { remap = true, desc = '[H]op [W]ords' })
      vim.keymap.set('', '<leader>hl', hop.hint_lines, { remap = true, desc = '[H]op [L]ines' })
      vim.keymap.set('', '<leader>hL', hop.hint_lines, { remap = true, desc = '[H]op [L]ines' })
      vim.keymap.set('', '<leader>ha', hop.hint_anywhere, { remap = true, desc = '[H]op [A]nywhere' })
    end,
  },

  {
    "abecodes/tabout.nvim",
    opts = {
      default_tab = '<C-Tab>'
    },
  },

  {
    "folke/drop.nvim",
    event = "VimEnter",
    opts = {
      theme = "leaves",            -- "leaves", "snow", "stars", "xmas", "spring", "summer"
      max = 40,                    -- maximum number of drops on the screen
      interval = 150,              -- every 150ms we update the drops
      screensaver = 1000 * 60 * 5, -- show after 5 minutes. Set to false, to disable
      filetypes = {},              -- will enable/disable automatically for the following filetypes
    }
  },

  {
    "LunarVim/bigfile.nvim",
    opts = {
    },
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
      -- <leader>rn rename
      vim.keymap.set("x", "<leader>re", ":Refactor extract ")
      vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
      vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
      vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
      vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
      vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
      vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
      vim.keymap.set({ "n", "x" }, "<leader>rr", function() require('refactoring').select_refactor() end)
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    config = function()
      require("rust-tools").setup({})
    end
  }, -- Lua

  -- {
  --   "folke/trouble.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   opts = {
  --   },
  -- },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
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
    opts = {
      open_mapping = [[<c-t>]],
      direction = 'horizontal',
      -- winbar = { enabled = true },
    },
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
    opts = {
      compile_command = { -- compile_command file generation configuration
        dir = "build",    -- location of the generated file
      },
    },
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
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        prefer_startup_root = true,
        sync_root_with_cwd = true,
        view = {
          width = 45,
        },
      }
    end,
  },

  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   },
  --   opts = {
  --     window = {
  --       mappings = {
  --         ["<space>"] = { "open", nowait = false, }
  --       },
  --     },
  --   }
  -- },
}
