return {
  'akinsho/flutter-tools.nvim',
  ft = 'dart',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function ()
    local on_attach = require('dieal.util.lsp').on_attach
    require('flutter-tools').setup({
      dev_log = {
        enabled = false,
      },
      dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      },
    })

    vim.keymap.set('n', '<leader>fru', '<CMD>:FlutterRun<CR>', { desc = '[F]lutter: [Ru]n App'})
    vim.keymap.set('n', '<leader>fre', '<CMD>:FlutterRestart<CR>', { desc = '[F]lutter: [Re]starts App'})
    vim.keymap.set('n', '<leader>fq', '<CMD>:FlutterQuit<CR>', { desc = '[F]lutter: [Q]uit App'})
    vim.keymap.set('n', '<leader>fe', '<CMD>:FlutterEmulators<CR>', { desc = '[F]lutter: [E]mulators'})
    vim.keymap.set('n', '<leader>fd', '<CMD>:FlutterDetach<CR>', { desc = '[F]lutter: [D]etach'})

    vim.api.nvim_create_autocmd({"BufWritePre"}, {
      pattern = {"*.dart"},
      command = "FlutterReload",
    })

    vim.api.nvim_create_autocmd({"QuitPre", "VimLeave"}, {
      pattern = {"*.dart"},
      command = "FlutterQuit",
    })
  end,
}
