
local opts = {noremap = true, silent = true}
local opts_expr = {noremap = true, silent = true, expr = true}
local bind = vim.api.nvim_set_keymap

bind('n', '<M-j>', ':resize -2<CR>', opts)
bind('n', '<M-k>', ':resize +2<CR>', opts)
bind('n', '<M-h>', ':vertical resize -2<CR>', opts)
bind('n', '<M-l>', ':vertical resize +2<CR>', opts)

bind('n', '<TAB>', ':bnext<CR>', opts)
bind('n', '<S-TAB>', ':bprevious<CR>', opts)

-- Disable arrow keys in insert and normal mode
bind('n', '<Up>', '<Nop>', opts)
bind('n', '<Down>', '<Nop>', opts)
bind('n', '<Left>', '<Nop>', opts)
bind('n', '<Right>', '<Nop>', opts)

bind('i', '<Up>', '<Nop>', opts)
bind('i', '<Down>', '<Nop>', opts)
bind('i', '<Left>', '<Nop>', opts)
bind('i', '<Right>', '<Nop>', opts)


-- Escape key clear highlights
bind('n', '<Esc>', ':noh<return><esc>', opts)


-- Toggle relative numbers with ctrl-n
bind('n', '<C-N>', ':set invrelativenumber<CR>', opts)

-- <TAB>: completion. TODO: Get this working in Lua.
vim.cmd 'inoremap <expr><TAB> pumvisible() ? "\\<C-n>" : "\\<TAB>"'
-- bind('n', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', opts_expr)
