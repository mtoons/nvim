return {
  {
    'echasnovski/mini.nvim',
    version = false,
    init = function()
      require('mini.pairs').setup()
      require('mini.surround').setup()
      require('mini.starter').setup()
      require('mini.cursorword').setup({ delay = 0, })
      require('mini.splitjoin').setup()
      require('mini.sessions').setup()
    end,
  },
}
