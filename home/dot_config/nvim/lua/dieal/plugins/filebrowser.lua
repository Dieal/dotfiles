local util = require('dieal.util.functions')
local nmap = util.nmap

return {

  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        keymaps = {
          ["<BS>"] = "actions.parent",
          ["<C-h>"] = "actions.toggle_hidden",
          ["C-p"] = "actions.preview",
          ["_"] = "actions.open_cwd",
        }
      })

      -- Keybindings
      nmap("<leader>bb", "<CMD>Oil<CR>", "[B]rowse Current [B]uffer Directory")
      nmap("<leader>br", "<CMD>Oil" .. vim.fn.getcwd() .. "<CR>", "[B]rowse [R]oot Directory")
      nmap("<leader>br", "<CMD>Oil" .. vim.fn.getcwd() .. "<CR>", "[B]rowse [R]oot Directory")
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup()

      -- Keybindings
      nmap("<leader>tt", "<CMD>NvimTreeToggle<CR>", "[T]oggle Neovim [T]ree")
    end
  }

}
