local util = require('dieal.util.functions')
local nmap = util.nmap
local imap = util.imap
local vmap = util.vmap

local personalVaultPath = "~/docs/vaults/personal"

nmap("<leader>oo", "<cmd>e " .. personalVaultPath .. "/obsidian.md<CR>", "[O]bsidian [O]pen Index")

return {

  -- [[[[ Markdown Previews ]]]]
  -- Terminal Rendering
  {
    "ellisonleao/glow.nvim",

    enabled = false,
    config = function ()

      require('glow').setup({
      });

      -- Keybindings
      nmap('<leader>mpt', '<CMD>Glow<CR>', '[M]arkdown [P]review [T]oggle')

    end,

    ft = { "markdown" },
    cmd = "Glow",
    lazy = true,
  },

  -- Browser Rendering
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function ()

      -- Keybindings
      nmap('<leader>mpr', '<CMD>MarkdownPreview<CR>', '[M]arkdown [P]review [R]un')
      nmap('<leader>mps', '<CMD>MarkdownPreviewStop<CR>', '[M]arkdown [P]review [S]top')

    end,
    lazy = true,
  },

  -- Markdown Utils
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
    config = function(_, opts)
      require("markdown").setup(opts)
    end,
  },

  -- Awesome Markdown Preview Plugin
  {
    "OXY2DEV/markview.nvim",

    dependencies = {
      -- You may not need this if you don't lazy load
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons"
    },
  },

  -- Obsidian Integration
  {
    'epwalsh/obsidian.nvim',
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    config = function ()

      require('obsidian').setup({
        workspaces = {
          {
            name = "personal",
            path = personalVaultPath,
          },
        },
        daily_notes = {
          folder = "fleeting/dailies",
          -- Optional, if you want to change the date format for the ID of daily notes.
          date_format = "%d-%m-%Y",
          -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
          template = "daily.md",
        },
        templates = {
          folder = "templates/",
          date_format = "%d-%m-%Y",
          time_format = "%H:%M",
        },

        ---@param url string
        follow_url_func = function(url)
          -- Open the URL in the default web browser.
          vim.fn.jobstart({"xdg-open", url})  -- linux
        end,

        mappings = {

          -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
          ["gf"] = {
            action = function()
              return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },

          -- Smart action depending on context, either follow link or toggle checkbox.
          ["<cr>"] = {
            action = function()
              return require("obsidian").util.smart_action()
            end,
            opts = { buffer = true, expr = true },
          }
        },
      })

      vim.opt.conceallevel = 1 -- concealment features

      nmap("<leader>ob", "<cmd>ObsidianBacklinks<CR>", "[O]bsidian [B]acklinks")
      nmap("<leader>ol", "<cmd>ObsidianLinks<CR>", "[O]bsidian [L]nks")
      nmap("<leader>otp", "<cmd>ObsidianTemplate<CR>", "[O]bsidian [T]em[p]late")
      nmap("<leader>otg", "<cmd>ObsidianTags<CR>", "[O]bsidian [T]a[g]s")
      nmap("<leader>os", "<cmd>ObsidianSearch<CR>", "[O]bsidian [S]earch")
      nmap("<leader>odn", "<cmd>ObsidianToday<CR>", "[O]bsidian [D]aily [N]ote")
      nmap("<leader>odl", "<cmd>ObsidianDailies<CR>", "[O]bsidian [D]ailies [L]ist")

      nmap("<leader>ch", function() return require("obsidian").util.toggle_checkbox() end, "Toggle [C][H]eckbox")
      vmap("<leader>ch", function() return require("obsidian").util.toggle_checkbox() end, "Toggle [C][H]eckbox")

      --[[ nmap("<leader>ot", function ()
        vim.ui.input({ prompt = "Inserisci il nome del tag" }, function (input)
          vim.cmd("ObsidianTags " .. input)
        end)
      end, "[O]bsidian [T]ags")
 ]]
      nmap("<leader>on", function ()
        vim.ui.input({ prompt = "Inserisci il nome/path della nuova nota" }, function (input)
          vim.cmd("ObsidianNew " .. vim.fn.getcwd() .. '/' .. input .. ".md")
        end)
      end, "[O]bsidian [N]ew Note")

      vmap("<C-l>", function ()
        vim.ui.input({ prompt = "Inserisci il nome/path della nuova nota" }, function (input)
          vim.cmd("ObsidianLinkNew " .. input .. ".md")
        end)
      end, "Obsidian Create New [L]ink")

      -- Adds a checkbox by writing ckb shortcut https://stackoverflow.com/questions/10982314/vim-how-to-create-a-key-binding-that-insert-a-piece-of-text
      vim.cmd("iab ckb - [ ]")

    end
  },
}

