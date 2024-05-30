return {
  -- NOTE: First, some plugins that don't require any configuration
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Saves / Restores Sessions
  'tpope/vim-obsession',

  -- Auto pair brackets
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  { 'nvim-tree/nvim-web-devicons' },

  -- Terminal
  { 'numToStr/FTerm.nvim', },

  -- -- Discord Rich Presence
  -- { 'andweeb/presence.nvim' },

  -- Abolish.vim, to keep case when substituting words
  { 'tpope/vim-abolish' },

  -- Programming specific plugins
  {
    'windwp/nvim-ts-autotag',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
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

  {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
  },
}
