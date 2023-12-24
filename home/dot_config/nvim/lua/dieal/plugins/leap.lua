return {
  {
    'ggandor/leap.nvim',
    dependencies= {
      'tpope/vim-repeat',
    },
    config = function()
      -- Leap
      require('leap').add_default_mappings()
    end
  },

}
