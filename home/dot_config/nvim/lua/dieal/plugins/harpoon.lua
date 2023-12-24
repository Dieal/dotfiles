return {
  -- Switch between buffers
  { 
    'ThePrimeagen/harpoon',
    config = function ()
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')

      vim.keymap.set('n', '<leader>hm', mark.add_file, { desc = '[H]arpoon: [M]ark file' });
      vim.keymap.set('n', '<leader>hr', mark.rm_file, { desc = '[H]arpoon: [R]emove Mark' });
      vim.keymap.set('n', '<leader>ht', ui.toggle_quick_menu, { desc = '[H]arpoon: [T]oggle Ui' });
      vim.keymap.set('n', '<C-n>', ui.nav_next, { desc = 'Harpoon: next mark' });
      vim.keymap.set('n', '<C-m>', ui.nav_prev, { desc = 'Harpoon: previous mark' });
    end
  },

}

