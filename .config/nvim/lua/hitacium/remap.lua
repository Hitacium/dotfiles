local opts_1 = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Variables --
local keymap = vim.api.nvim_set_keymap
local keyset = vim.keymap.set

-- Delete without yanking
keymap("n", "d", '"_d', opts_1)

-- Line Nav
keymap("n", "é", "0", opts_1) -- line beginning
keymap("n", "0", "$", opts_1) -- line end

keymap("n", "z", "w", opts_1) -- next word
keymap("n", "dz", "dw", opts_1) -- delete next word

-- Custom Exit
keyset("n", "<leader>pv", vim.cmd.Ex)
