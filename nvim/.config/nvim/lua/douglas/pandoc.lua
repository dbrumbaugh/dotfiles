local status_ok, pandoc = pcall(require, "vim-pandoc")
if not status_ok then
  return
end

local status_ok, pandoc_syntax = pcall(require, "vim-pandoc-syntax")
if not status_ok then
  return
end

vim.cmd("let vim.g.pandoc#folding#fdc = 0")
