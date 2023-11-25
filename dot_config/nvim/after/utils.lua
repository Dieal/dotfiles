-- Keymaps
function addNormalMap(keymap, command, description)
  vim.keymap.set('n', keymap, command, { desc = description })
end

function addVisualMap(keymap, command, description)
  vim.keymap.set('v', keymap, command, { desc = description })
end
