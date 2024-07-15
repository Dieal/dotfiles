return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
      "marilari88/neotest-vitest",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-vim-test",
      "olimorris/neotest-phpunit",
    },
    enabled = false,
    --[[ lazy = true,
    ft = { 'js', 'php' }, ]]
    config = function ()
      local neotest = require('neotest')

      -- Setup
      neotest.setup({
        adapters = {
          require("neotest-jest"),
          require("neotest-vitest"),
          require("neotest-phpunit"),
          -- require("neotest-dart"),
          require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua" },
          }),
        },
      })

      -- Keybindings
      local util = require('dieal.util.functions')
      local nmap = util.nmap

      nmap('<leader>tr', neotest.run.run, "[T]est [R]un")
      nmap('<leader>ts', neotest.run.run, "[T]est [S]top")

    end
  },
}
