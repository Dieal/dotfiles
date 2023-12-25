return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest",
      "sidlatau/neotest-dart",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-vim-test",
    },
    config = function ()
      local neotest = require('neotest')

      -- Setup
      neotest.setup({
        adapters = {
          require("neotest-jest"),
          require("neotest-vitest"),
          require("neotest-dart"),
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
