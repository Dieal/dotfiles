return {
  -- Themes

  -- {
  --   -- Theme inspired by Atom
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },

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
}
