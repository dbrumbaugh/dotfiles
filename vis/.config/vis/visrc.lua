require('vis')

-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
    -- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    -- Your per window configuration options e.g.
    -- vis:command('set number')
    vis:command('set theme gruvbox')
    vis:command('set nu')
    vis:command('set rnu')
    vis:command('set cul')
    vis:command('set cc 75')
    vis:command('set show-tabs')
    vis:command('set et')
    vis:command('set tw 4')
    vis:command('set ic')
    vis:command('set ai')
end)
