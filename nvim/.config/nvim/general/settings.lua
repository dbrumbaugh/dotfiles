vim.g.mapleader = ' '

vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.fileencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.pumheight = 10
vim.opt.ruler = true
vim.opt.cmdheight = 2
vim.opt.mouse = 'a'
vim.opt.splitbelow = true
vim.opt.splitright = true


vim.opt.laststatus = 0
vim.opt.background = 'dark'
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500


vim.opt.conceallevel = 0
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true


vim.o.iskeyword = vim.o.iskeyword .. ',-'
vim.bo.iskeyword = vim.bo.iskeyword .. ',-'
vim.opt.formatoptions = 'jql'

vim.o.colorcolumn = '81'
for i = 82,335 do
    vim.o.colorcolumn = vim.o.colorcolumn .. ',' .. i
end




--au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

--cmap w!! w !sudo tee %
