local status_ok, vwiki = pcall(require, "vimwiki")
if not status_ok then
  return
end

local lst = {
    path = '~/.local/share/vimwiki/phdwiki',
    syntax = "markdown",
    ext = ".wiki",
}

vim.g.vimwiki_list = {
    lst
}

