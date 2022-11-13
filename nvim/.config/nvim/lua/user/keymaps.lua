-- Keymaps

-- Short options insertion
-- Noremap means "no recurse map"
-- Silent means we don't have an output for the map
local opts = {noremap = true, silent = true}

-- Short function name
local keymap = vim.api.nvim_set_keymap

-- Remap <SPACE> as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    normal_mode = "n"
--    visual mode = "v"
--    insert_mode = "i"
--    visual_block_mode = "x"
--    term_mode = "t"
--    command_mode = "c"

-- Normal mode
-- Window Navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
keymap("n", "<leader>k", "<C-w>k", opts)

-- Netrw
keymap("n", "<leader>e", ":Lex 30<cr>", opts) -- Opens Netrw

-- Buffer Controls
keymap("n", "<S-l>", ":bnext<CR>", opts) -- Next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- Previous buffer
keymap("n", "<S-q>", ":Bdelete!<CR>", opts) -- Closes buffer

-- Insert mode

-- Visual Mode
-- It doesn't yank selected text after pasting
keymap("v", "p", '"_dP', opts)
