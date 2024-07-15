return {
  'L3MON4D3/LuaSnip',
  dependencies = {
      'rafamadriz/friendly-snippets',
  },
  config = function ()
    local luasnip = require('luasnip')

    -- loads vscode style snippets from installed plugins
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Extend snippets
    -- filetype_extend (filetype, snippets)
    require'luasnip'.filetype_extend("php", {"html"})
    require'luasnip'.filetype_extend("blade", {"html"})
    require'luasnip'.filetype_extend("astro", {"html"})
    require'luasnip'.filetype_extend("typescript", {"javascript"})
    luasnip.config.setup {}

    -- <c-k> snippet expansion key
    -- this will expand the current item or jump to the next item within the snippet.
    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    -- <c-j> jump backwards key.
    -- this always moves to the previous item within the snippet
    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })

    -- shorcut to source luasnips file again, which will reload snippets
    vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/dieal/plugins/luasnip.lua<CR>")
  end
}
