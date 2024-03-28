return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = "InsertEnter", -- Lazy loading when entering in insert mode
    dependencies = {
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path', -- source for file system paths
      'hrsh7th/cmp-buffer', -- source for text in buffer

      -- LSP Pittograms
      'onsails/lspkind.nvim',
    },

    -- See `:help cmp`
    config = function()
      local cmp = require 'cmp'
      local lspkind = require('lspkind')
      local luasnip = require 'luasnip'

      cmp.setup {
        completion = { -- How the completion menu works
          completeopt = "menu,menuone,preview,noselect", -- :h completeopt
        },
        snippet = { -- Config how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = { -- Order matters!
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'path' },
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {}, -- Open nvim-cmp suggestion
          ['<C-q>'] = cmp.mapping.abort {}, -- Close window
          ["<CR>"] = cmp.mapping({ -- Safely select entries with <CR> (If nothing is selected add a newline as usual.)
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            local ok, _ = pcall(require, 'luasnip')
            if not ok then
              return
            end

            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            local ok, _ = pcall(require, 'luasnip')
            if not ok then
              return
            end

            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
              return vim_item
            end
          })
        },
      }

    end
  },
  -- Inline Parameters
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function ()
      local plugin = require('lsp_signature')
      plugin.on_attach({
        toggle_key = '<C-s>',
      })
    end
  }
}
