return {
  -- Switch between buffers
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require('harpoon')
      harpoon:setup()

      vim.keymap.set('n', '<leader>hm', function() harpoon:list():add() end, { desc = '[H]arpoon: [M]ark file' });
      vim.keymap.set('n', '<leader>hr', function() harpoon:list():remove() end, { desc = '[H]arpoon: [R]emove Mark' });

      vim.keymap.set('n', '<leader>ht', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon: [T]oggle Ui' });

      vim.keymap.set('n', '<F1>', function() harpoon:list():select(1) end, { desc = '[H]arpoon: Buffer 1' });
      vim.keymap.set('n', '<F2>', function() harpoon:list():select(2) end, { desc = '[H]arpoon: Buffer 2' });
      vim.keymap.set('n', '<F3>', function() harpoon:list():select(3) end, { desc = '[H]arpoon: Buffer 3' });
      vim.keymap.set('n', '<F4>', function() harpoon:list():select(4) end, { desc = '[H]arpoon: Buffer 4' });
      vim.keymap.set('n', '<F5>', function() harpoon:list():select(5) end, { desc = '[H]arpoon: Buffer 5' });
      vim.keymap.set('n', '<F6>', function() harpoon:list():select(6) end, { desc = '[H]arpoon: Buffer 6' });

      vim.keymap.set('n', '<C-n>', function() harpoon:list():next() end, { desc = 'Harpoon: next mark' });
      vim.keymap.set('n', '<C-m>', function() harpoon:list():prev() end, { desc = 'Harpoon: previous mark' });

    end
  }
}

