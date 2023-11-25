-- Inline code execution (JS, TS, Python, Lua)
require('lab').setup {
  code_runner = {
    enabled = true,
  },
  quick_data = {
    enabled = false,
  },
}

vim.keymap.set('n', '<F9>', '<Cmd>Lab code run<CR>', { desc = 'Start Code Execution' });
vim.keymap.set('n', '<F10>', '<Cmd>Lab code stop<CR>', { desc = 'Stop Code Execution' });
