return {
  -- Themes

  --[[ {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  }, ]]

  {
    'catppuccin/nvim',
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = "frappe", -- frappe (slightly light), macchiato (dark), mocha (darkest)
        no_italic = true,
        no_bold = true,
      })
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  --[[ {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight-moon'
    end
  } ]]

  --[[ {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic' .load()
    end
  } ]]

  --[[ {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme 'kanagawa-wave'
    end
  } ]]
}
