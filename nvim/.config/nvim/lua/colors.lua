local set_color = vim.api.nvim_set_hl

background = "#141414"
primary = "#ffffff"
secondary = "#a8a8a8"
accent = "#18F5A2"
accent_hover = "#1691f5"
str = "#c9c9c9"
orange = "#f2a272"
red = "#ff3d1f"
comment = "#616161"
cursor_line = "#2C2E33"

set_color(0, "@variable", { fg = primary })
set_color(0, "Added", { fg = accent })
set_color(0, "Comment", { fg = comment })
set_color(0, "Constant", { fg = str })
set_color(0, "CurSearch", { fg = background, bg = orange })
set_color(0, "Cursor", { fg = accent, bg = background })
set_color(0, "CursorLine", { bg = cursor_line })
set_color(0, "Delimiter", { fg = secondary })
set_color(0, "Directory", { fg = str })
set_color(0, "Error", { fg = red })
set_color(0, "FloatBorder", { fg = comment })
set_color(0, "Function", { fg = primary })
set_color(0, "Identifier", { fg = primary })
set_color(0, "MatchParen", { fg = orange, bg = cursor_line })
set_color(0, "Normal", { fg = primary, bg = transparent })
set_color(0, "Operator", { fg = accent })
set_color(0, "Search", { fg = cursor_line, bg = accent })
set_color(0, "Special", { fg = primary })
set_color(0, "Statement", { fg = secondary })
set_color(0, "StatusLine", { fg = primary, bg = background })
set_color(0, "String", { fg = str })
set_color(0, "Todo", { fg = orange })
set_color(0, "Type", { fg = primary })
set_color(0, "WarningMsg", { fg = orange })
set_color(0, "WinBar", { fg = primary, bg = transparent })
set_color(0, "WinSeparator", { fg = secondary, bg = none })

-- LSP
set_color(0, "DiagnosticError", { fg = red })
set_color(0, "DiagnosticUnderlineError", { fg = red })
set_color(0, "DiagnosticUnderlineWarn", { fg = orange })
set_color(0, "DiagnosticWarn", { fg = orange })

-- Plugins
set_color(0, "IlluminatedWordText", { bg = cursor_line, fg = accent })
set_color(0, "IlluminatedWordRead", { bg = cursor_line, fg = accent })
set_color(0, "IlluminatedWordRead", { bg = cursor_line, fg = accent })
set_color(0, "FzfLuaBorder", { fg = comment })
set_color(0, "FzfLuaFzfMatch", { fg = accent })
set_color(0, "NvimTreeHighlight", { fg = primary })
set_color(0, "NvimTreeNormal", { fg = primary, bg = background })
set_color(0, "NvimTreeNormalFloat", { fg = primary, bg = background })
set_color(0, "NvimTreeRootFolder", { fg = accent })
set_color(0, "NvimFloat", { bg = accent })
set_color(0, "lualine_c", { fg = accent })
set_color(0, "NeogitDiffDeleteHighlight", { fg = red })
set_color(0, "NeogitDiffDelete", { fg = red })
