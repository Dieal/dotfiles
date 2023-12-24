return {
  -- Note taking
  {
    'vimwiki/vimwiki',
    config = function()
        vim.g.vimwiki_list = {
            {
                path = '~/docs/notes',
                syntax = 'markdown',
                ext = '.md',
            }
        }
        vim.cmd("call vimwiki#vars#init()")
    end
  },

}
