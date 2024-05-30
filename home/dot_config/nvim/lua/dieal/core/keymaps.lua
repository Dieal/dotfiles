-- [[ Basic Keymaps ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Yanking
vim.keymap.set("n", '<leader>y', '"+yy', { desc = "Yank to system clipboard "})
vim.keymap.set("v", '<leader>y', '"+y', { desc = "Yank to system clipboard "})

-- Capitalize
vim.keymap.set("n", '<leader>cp', "<CMD>s/\\<./\\u&/g<CR>", { desc = "[C]a[P]italize Each Word in line"})
vim.keymap.set("v", '<leader>cp', "<CMD>s/\\<./\\u&/g<CR>", { desc = "[C]a[P]italize Each Word in selection"})

-- Center Cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'Q', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Floating terminal
vim.keymap.set('n', '<A-t>', '<CMD>lua require("FTerm").toggle()<CR>', { desc = '[T]oggle Terminal' })
vim.keymap.set('t', '<A-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = '[T]oggle Terminal' })

-- Split windows navigation
vim.keymap.set('n', '<C-q>', '<C-w>q', { desc = 'Close window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right split window' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left split window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to higher split window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower split window' })
