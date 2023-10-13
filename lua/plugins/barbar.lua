return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false -- Move to previous/next
      vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })
      vim.api.nvim_set_keymap('n', '<A-;>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
      -- Re-order to previous/next
      vim.api.nvim_set_keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Move buffer' })
      vim.api.nvim_set_keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Move buffer' })
      -- Goto buffer in position...
      vim.api.nvim_set_keymap('n', '<A-&>', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true, desc = 'Buffer 1' })
      vim.api.nvim_set_keymap('n', '<A-é>', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true, desc = 'Buffer 2' })
      vim.api.nvim_set_keymap('n', '<A-">', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true, desc = 'Buffer 3' })
      vim.api.nvim_set_keymap('n', "<A-'>", '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true, desc = 'Buffer 4' })
      vim.api.nvim_set_keymap('n', '<A-(>', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true, desc = 'Buffer 5' })
      vim.api.nvim_set_keymap('n', '<A-->', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true, desc = 'Buffer 6' })
      vim.api.nvim_set_keymap('n', '<A-è>', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true, desc = 'Buffer 7' })
      vim.api.nvim_set_keymap('n', '<A-_>', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true, desc = 'Buffer 8' })
      vim.api.nvim_set_keymap('n', '<A-ç>', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true, desc = 'Buffer 9' })
      vim.api.nvim_set_keymap('n', '<A-à>', '<Cmd>BufferLast<CR>', { noremap = true, silent = true, desc = 'Last buffer' })
      -- Pin/unpin buffer
      vim.api.nvim_set_keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', { noremap = true, silent = true, desc = 'Pin buffer' })
      -- Close buffer
      vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = 'Close buffer' })
      -- Wipeout buffer
      --                 :BufferWipeout
      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
      -- Magic buffer-picking mode
      vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', { noremap = true, silent = true, desc = 'Pick buffer' })
      -- Sort automatically by...
      vim.api.nvim_set_keymap('n', '<leader>bn', '<Cmd>BufferOrderByBufferNumber<CR>', { noremap = true, silent = true, desc = '[B]uffer by [N]umber' })
      vim.api.nvim_set_keymap('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', { noremap = true, silent = true, desc = '[B]uffer by [D]irectory' })
      vim.api.nvim_set_keymap('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', { noremap = true, silent = true, desc = '[B]uffer by [L]anguage' })
      vim.api.nvim_set_keymap('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { noremap = true, silent = true, desc = '[B]uffer by [W]indow' })

      -- Other:
      -- :BarbarEnable - enables barbar (enabled by default)
      -- :BarbarDisable - very bad command, should never be used
    end,
    opts = {
      auto_hide = 1,
    },
  },
}
