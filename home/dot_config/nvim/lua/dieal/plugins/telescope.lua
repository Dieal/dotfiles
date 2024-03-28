return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local fb_actions = require "telescope._extensions.file_browser.actions"

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        file_browser = {
          theme = 'ivy',
          hijack_netrw = true, -- disables netrw and use telescope-file-browser in its place
        }
      }
    })

    -- To get telescope-file-browser loaded and working with telescope,
    -- you need to call load_extension, somewhere after setup function:
    require("telescope").load_extension "file_browser"

    vim.api.nvim_set_keymap(
      "n",
      "<space>br",
      ":Telescope file_browser<CR>",
      { noremap = true, desc = "File [B]rowser from [R]oot" }
    )

    -- open file_browser with the path of the current buffer
    vim.api.nvim_set_keymap(
      "n",
      "<space>bb",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { noremap = true, desc = "File [B]rowser from current [B]uffer"}
    )

    -- -- open file_browser with the path of the current buffer
    -- vim.api.nvim_set_keymap(
    --   "n",
    --   "<space>fb",
    --   ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    --   { noremap = true }
    -- )

    -- Enable telescope fzf native, if installed
    pcall(telescope.load_extension, 'fzf')

    -- Enable "Project.nvim" telescope integration
    pcall(telescope.load_extension, 'projects')

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch  [B]uffers' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch  [K]eybindings' })

    -- Projects.nvim
    vim.keymap.set('n', '<leader>srp', telescope.extensions.projects.projects)
  end,
}
