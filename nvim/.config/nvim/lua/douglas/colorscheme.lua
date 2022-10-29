local colorscheme = "gruvbox"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
    vim.notify("Colorscheme " .. colorscheme .. " not found.")
    return
end

if colorscheme == "gruvbox" then
--    vim.cmd("hi clear CursorLine")
    --vim.cmd("hi CursorLine gui=underline cterm=underline")

    --vim.cmd("hi Normal guibg=NONE")
    --vim.cmd("hi SignColumn guibg=NONE")
    --vim.cmd("hi CursorLineNr guibg=NONE")

    --vim.cmd("hi GruvboxAquaSign guibg=NONE")
    --vim.cmd("hi GruvboxBlueSign guibg=NONE")
    --vim.cmd("hi GruvboxGreenSign guibg=NONE")
    --vim.cmd("hi GruvboxOrangeSign guibg=NONE")
    --vim.cmd("hi GruvboxPurpleSign guibg=NONE")
    --vim.cmd("hi GruvboxYellowSign guibg=NONE")
    --vim.cmd("hi GruvboxRedSign guibg=NONE")

    --vim.cmd("hi GitSignsAdd guibg=NONE")
    --vim.cmd("hi GitSignsChange guibg=NONE")
    --vim.cmd("hi GitSignsDelete guibg=NONE")
    --vim.cmd("hi DiagnosticSignError guibg=NONE")
    --vim.cmd("hi DiagnosticSignHint guibg=NONE")
    --vim.cmd("hi DiagnosticSignInfo guibg=NONE")
    --vim.cmd("hi DiagnosticSignWarn guibg=NONE")
    vim.opt.pumblend = 15
    vim.opt.winblend = 15
end
