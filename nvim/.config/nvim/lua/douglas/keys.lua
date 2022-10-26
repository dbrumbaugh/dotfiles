local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize windows
keymap("n", "<A-k>", ":resize -2<CR>", opts)
keymap("n", "<A-j>", ":resize +2<CR>", opts)
keymap("n", "<A-h>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-l>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Maintain register value after visual mode paste
keymap("v", "p", '"_dP', opts)

-- Toggle relative numbering with ctrl-N
keymap('n', '<C-N>', ':set invrelativenumber<CR>', opts)
keymap('i', '<C-N>', ':set invrelativenumber<CR>', opts)

-- Clear highlights with ESC
keymap('n', '<Esc>', ':noh<return><esc>', opts)


-- Telescope keybindings
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)


-- w!! force saves using sudo
-- TODO: look into askpass helpers to allow sudo password entry
keymap('c', 'w!!', 'w !sudo tee %', opts)

keymap('n', '<leader>r', ':LspRestart<cr>', opts)

keymap("n", "<leader>c", ":ColorToggle<cr>", opts)

keymap("n", "<m-k>", ":Man<cr>", opts)

keymap("n", "<leader>b", ":!rebuild<cr>", opts)
