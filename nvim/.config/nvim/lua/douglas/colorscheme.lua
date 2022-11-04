local colorscheme = "gruvbox"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
    vim.notify("Colorscheme " .. colorscheme .. " not found.")
    return
end

vim.opt.pumblend = 15
vim.opt.winblend = 15
