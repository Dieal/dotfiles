return {
  -- NOTE: First, some plugins that don't require any configuration
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Auto pair brackets
  { 'jiangmiao/auto-pairs' },

  -- File tree
  -- { 'nvim-tree/nvim-tree.lua', config = function()
  --   -- Disable Netwr
  --   vim.g.loaded_netrw       = 1
  --   vim.g.loaded_netrwPlugin = 1
  --
  --   -- [nvim-tree setup]
  --   require('nvim-tree').setup();
  --
  --   vim.keymap.set('n', '<leader>t', vim.cmd.NvimTreeToggle, { desc = "Toggles [T]ree" })
  -- end},
  { 'nvim-tree/nvim-web-devicons' },

  -- Terminal
  { 'numToStr/FTerm.nvim', },

  -- Discord Rich Presence
  { 'andweeb/presence.nvim' },

  -- Programming specific plugins
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup();
    end
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
    opts = {
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'ahmedkhalf/project.nvim',
    config = function()
      require("project_nvim").setup {
        patterns = { ".git" },
        mappings = {
          n = {
          }
        }
      }
    end
  },

  -- { 'jakewvincent/mkdnflow.nvim' },

  -- {
  --     "iamcco/markdown-preview.nvim",
  --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --     ft = { "markdown" },
  --     build = function() vim.fn["mkdp#util#install"]() end,
  -- },
}
