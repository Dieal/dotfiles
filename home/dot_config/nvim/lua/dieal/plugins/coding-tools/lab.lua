return {
  -- Inline code execution
  { 
    '0x100101/lab.nvim', 
    build = 'cd js && npm ci', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
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
    end
  },
}
