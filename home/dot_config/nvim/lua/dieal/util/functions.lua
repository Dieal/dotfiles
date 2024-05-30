local util = {
  nmap = function (keys, func, desc)
    vim.keymap.set('n', keys, func, { desc = desc })
  end,
  imap = function (keys, func, desc)
    vim.keymap.set('i', keys, func, { desc = desc })
  end,
  vmap = function (keys, func, desc)
    vim.keymap.set('v', keys, func, { desc = desc })
  end,
}

return util
