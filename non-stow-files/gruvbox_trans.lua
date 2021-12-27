-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
  black        = '#282828',
  white        = '#ebdbb2',
  red          = '#fb4934',
  green        = '#b8bb26',
  blue         = '#83a598',
  yellow       = '#fe8019',
  gray         = '#a89984',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
  transparent  = 'NONE',
}

return {
  normal = {
    a = { bg = colors.transparent, fg = colors.white, gui = 'bold' },
    b = { bg = colors.transparent, fg = colors.gray },
    c = { bg = colors.transparent, fg = colors.white },
  },
  insert = {
    a = { bg = colors.transparent, fg = colors.blue, gui = 'bold' },
    b = { bg = colors.transparent, fg = colors.gray },
    c = { bg = colors.transparent, fg = colors.white },
  },
  visual = {
    a = { bg = colors.transparent, fg = colors.yellow, gui = 'bold' },
    b = { bg = colors.transparent, fg = colors.gray },
    c = { bg = colors.transparent, fg = colors.white },
  },
  replace = {
    a = { bg = colors.transparent, fg = colors.red, gui = 'bold' },
    b = { bg = colors.transparent, fg = colors.gray },
    c = { bg = colors.transparent, fg = colors.white },
  },
  command = {
    a = { bg = colors.transparent, fg = colors.green, gui = 'bold' },
    b = { bg = colors.transparent, fg = colors.gray },
    c = { bg = colors.transparent, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.transparent, fg = colors.gray }, --, gui = 'bold' },
    b = { bg = colors.transparent, fg = colors.gray },
    c = { bg = colors.transparent, fg = colors.gray },
  },
}
