vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "claudedark"

local hi = vim.api.nvim_set_hl

local bg     = "#000000"
local bg2    = "#0d0d0d"
local dim    = "#222222"
local gray   = "#555555"  -- comments
local fg     = "#d4d4d4"  -- normal text
local white  = "#ffffff"  -- function names
local red    = "#e05555"  -- keywords
local orange = "#e07830"  -- booleans, builtins
local darkred = "#7a1a1a" -- statusline accent
local yellow = "#d4a044"  -- constants, numbers
local green  = "#6ab04c"  -- strings
local cyan   = "#3aacac"  -- types
local blue   = "#5599dd"  -- imports, includes
local purple = "#9966cc"  -- special, decorators

-- Base UI
hi(0, "Normal",       { fg = fg,     bg = bg })
hi(0, "NormalFloat",  { fg = fg,     bg = bg2 })
hi(0, "LineNr",       { fg = dim })
hi(0, "CursorLine",   { bg = bg2 })
hi(0, "CursorLineNr", { fg = orange, bold = true })
hi(0, "SignColumn",   { bg = bg })
hi(0, "ColorColumn",  { bg = bg2 })
hi(0, "VertSplit",    { fg = dim })
hi(0, "WinSeparator", { fg = dim })
hi(0, "StatusLine",   { fg = fg,     bg = bg2 })
hi(0, "StatusLineNC", { fg = gray,   bg = bg })
hi(0, "Pmenu",        { fg = fg,     bg = bg2 })
hi(0, "PmenuSel",     { fg = white,  bg = orange })
hi(0, "Visual",       { bg = "#1a1a1a" })
hi(0, "Search",       { fg = bg,     bg = orange })
hi(0, "IncSearch",    { fg = bg,     bg = yellow })
hi(0, "EndOfBuffer",  { fg = bg })

-- Syntax
hi(0, "Comment",      { fg = gray,   italic = true })
hi(0, "String",       { fg = green })
hi(0, "Character",    { fg = green })
hi(0, "Number",       { fg = yellow })
hi(0, "Float",        { fg = yellow })
hi(0, "Boolean",      { fg = orange, bold = true })
hi(0, "Keyword",      { fg = red,    bold = true })
hi(0, "Statement",    { fg = red,    bold = true })
hi(0, "Conditional",  { fg = red,    bold = true })
hi(0, "Repeat",       { fg = red,    bold = true })
hi(0, "Exception",    { fg = red })
hi(0, "Operator",     { fg = fg })
hi(0, "Identifier",   { fg = fg })
hi(0, "Function",     { fg = white,  bold = true })
hi(0, "Type",         { fg = cyan })
hi(0, "StorageClass", { fg = red })
hi(0, "Structure",    { fg = cyan })
hi(0, "Typedef",      { fg = cyan })
hi(0, "Constant",     { fg = yellow })
hi(0, "Special",      { fg = purple })
hi(0, "SpecialChar",  { fg = green })
hi(0, "PreProc",      { fg = blue })
hi(0, "Include",      { fg = blue })
hi(0, "Define",       { fg = blue })
hi(0, "Macro",        { fg = purple })
hi(0, "Error",        { fg = "#ff4444", bold = true })
hi(0, "Todo",         { fg = orange, bold = true })
hi(0, "Delimiter",    { fg = fg })

-- Treesitter
hi(0, "@keyword",           { fg = red,    bold = true })
hi(0, "@keyword.return",    { fg = red,    bold = true })
hi(0, "@keyword.function",  { fg = red,    bold = true })
hi(0, "@keyword.import",    { fg = blue })
hi(0, "@keyword.operator",  { fg = red })
hi(0, "@function",          { fg = white,  bold = true })
hi(0, "@function.builtin",  { fg = cyan })
hi(0, "@function.call",     { fg = white })
hi(0, "@method",            { fg = white,  bold = true })
hi(0, "@method.call",       { fg = white })
hi(0, "@constructor",       { fg = cyan })
hi(0, "@type",              { fg = cyan })
hi(0, "@type.builtin",      { fg = cyan,   bold = true })
hi(0, "@type.definition",   { fg = cyan })
hi(0, "@string",            { fg = green })
hi(0, "@string.escape",     { fg = orange })
hi(0, "@number",            { fg = yellow })
hi(0, "@float",             { fg = yellow })
hi(0, "@boolean",           { fg = orange, bold = true })
hi(0, "@comment",           { fg = gray,   italic = true })
hi(0, "@variable",          { fg = fg })
hi(0, "@variable.builtin",  { fg = orange })
hi(0, "@parameter",         { fg = fg })
hi(0, "@property",          { fg = fg })
hi(0, "@field",             { fg = fg })
hi(0, "@operator",          { fg = fg })
hi(0, "@punctuation",       { fg = fg })
hi(0, "@punctuation.bracket",{ fg = gray })
hi(0, "@constant",          { fg = yellow })
hi(0, "@constant.builtin",  { fg = orange })
hi(0, "@namespace",         { fg = blue })
hi(0, "@attribute",         { fg = purple })
hi(0, "@tag",               { fg = red })
hi(0, "@tag.attribute",     { fg = yellow })
hi(0, "@tag.delimiter",     { fg = gray })

-- Markdown
hi(0, "@markup.heading.1",     { fg = red,    bold = true })
hi(0, "@markup.heading.2",     { fg = orange, bold = true })
hi(0, "@markup.heading.3",     { fg = yellow, bold = true })
hi(0, "@markup.heading.4",     { fg = green,  bold = true })
hi(0, "@markup.heading.5",     { fg = cyan,   bold = true })
hi(0, "@markup.heading.6",     { fg = blue,   bold = true })
hi(0, "@markup.strong",        { fg = white,  bold = true })
hi(0, "@markup.italic",        { fg = fg,     italic = true })
hi(0, "@markup.strikethrough", { fg = gray,   strikethrough = true })
hi(0, "@markup.link",          { fg = blue,   underline = true })
hi(0, "@markup.link.label",    { fg = cyan })
hi(0, "@markup.raw",           { fg = green })
hi(0, "@markup.list",          { fg = red })
hi(0, "@markup.list.checked",  { fg = gray })
hi(0, "@markup.quote",         { fg = gray,   italic = true })

-- Diagnostics
hi(0, "DiagnosticError", { fg = "#ff4444" })
hi(0, "DiagnosticWarn",  { fg = orange })
hi(0, "DiagnosticInfo",  { fg = cyan })
hi(0, "DiagnosticHint",  { fg = gray })

-- Disable diagnostic underlines
hi(0, "DiagnosticUnderlineError", { underline = false, undercurl = false })
hi(0, "DiagnosticUnderlineWarn",  { underline = false, undercurl = false })
hi(0, "DiagnosticUnderlineInfo",  { underline = false, undercurl = false })
hi(0, "DiagnosticUnderlineHint",  { underline = false, undercurl = false })
hi(0, "SpellBad",   { underline = false, undercurl = false })
hi(0, "SpellCap",   { underline = false, undercurl = false })
hi(0, "SpellRare",  { underline = false, undercurl = false })
hi(0, "SpellLocal", { underline = false, undercurl = false })

-- Lualine (applied after plugins load)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    hi(0, "lualine_a_normal",   { fg = white, bg = darkred, bold = true })
    hi(0, "lualine_a_insert",   { fg = white, bg = darkred, bold = true })
    hi(0, "lualine_a_visual",   { fg = white, bg = darkred, bold = true })
    hi(0, "lualine_a_replace",  { fg = white, bg = darkred, bold = true })
    hi(0, "lualine_a_command",  { fg = white, bg = darkred, bold = true })
    hi(0, "lualine_b_normal",   { fg = fg,    bg = dim })
    hi(0, "lualine_b_insert",   { fg = fg,    bg = dim })
    hi(0, "lualine_b_visual",   { fg = fg,    bg = dim })
    hi(0, "lualine_b_replace",  { fg = fg,    bg = dim })
    hi(0, "lualine_b_command",  { fg = fg,    bg = dim })
    hi(0, "lualine_c_normal",   { fg = gray,  bg = bg })
    hi(0, "lualine_c_insert",   { fg = gray,  bg = bg })
    hi(0, "lualine_c_visual",   { fg = gray,  bg = bg })
    hi(0, "lualine_c_replace",  { fg = gray,  bg = bg })
    hi(0, "lualine_c_command",  { fg = gray,  bg = bg })
  end,
})
