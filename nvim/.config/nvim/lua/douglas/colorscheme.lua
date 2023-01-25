local colorscheme = "gruvbox"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
    vim.notify("Colorscheme " .. colorscheme .. " not found.")
    return
end

vim.opt.pumblend = 15
vim.opt.winblend = 15

-- Set the color column to help enforce
-- code width
str = ""
for i=120,256,1
do
    str = str .. i .. ","
end
str = str .. 256

vim.opt.colorcolumn = str
-- Can set the colorcolumn to red by uncommenting this
--vim.api.nvim_set_hl(0, "ColorColumn", {bg="#fb4934"})
