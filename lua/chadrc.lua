---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "carbonfox",
  hl_override = {
    Comment             = { fg = "#d3fc03", italic = true },
    ["@comment"]        = { fg = "#d3fc03", italic = true },

    -- keywords
    ["@keyword"]              = { fg = "#2ac3de" },
    ["@keyword.lua"]          = { fg = "#2ac3de" },
    ["@keyword.function"]     = { fg = "#2ac3de" },
    ["@keyword.function.lua"] = { fg = "#2ac3de" },
    ["@keyword.return"]       = { fg = "#2ac3de" },
    ["@keyword.return.lua"]   = { fg = "#2ac3de" },
    ["@keyword.operator"]     = { fg = "#2ac3de" },
    ["@keyword.conditional"]  = { fg = "#2ac3de" },
    ["@keyword.repeat"]       = { fg = "#2ac3de" },
    ["@keyword.type"]         = { fg = "#2ac3de" },
    ["@keyword.coroutine"]    = { fg = "#2ac3de" },
    ["@keyword.import"]       = { fg = "#2ac3de" },
    ["@keyword.import.lua"]   = { fg = "#2ac3de" },

    -- functions (all amber — definitions match calls)
    ["@function"]                  = { fg = "#e0af68" },
    ["@function.method"]           = { fg = "#e0af68" },
    ["@function.call"]             = { fg = "#e0af68" },
    ["@function.call.lua"]         = { fg = "#e0af68" },
    ["@function.method.call"]      = { fg = "#e0af68" },
    ["@function.method.call.lua"]  = { fg = "#e0af68" },
    ["@function.builtin"]          = { fg = "#2ac3de" },
    ["@function.builtin.lua"]      = { fg = "#2ac3de" },

    -- module/namespace (e.g. 'fmt' in fmt.Println()) — structural, same as types
    ["@module"]     = { fg = "#7aa2f7" },
    ["@namespace"]  = { fg = "#7aa2f7" },

    -- legacy @include (Go parser uses this for package/import)
    ["@include"]    = { fg = "#2ac3de" },

    -- Include is what @keyword.import *links to* at runtime — cyan like all keywords
    Include         = { fg = "#2ac3de" },

    -- types
    ["@type"]         = { fg = "#7aa2f7" },

    -- numbers and constants: compile-time fixed values → orange
    ["@number"]       = { fg = "#ff9e64" },
    ["@number.float"] = { fg = "#ff9e64" },

    -- variables / parameters / constants (names you define)
    ["@variable"]                  = { fg = "#fcf003" },
    ["@variable.lua"]              = { fg = "#fcf003" },
    ["@variable.member"]           = { fg = "#7aa2f7" },
    ["@variable.member.lua"]       = { fg = "#7aa2f7" },
    ["@variable.parameter"]        = { fg = "#fcf003" },
    ["@constant"]                  = { fg = "#ff9e64" },

    -- NvimTree file colours
    NvimTreeExecFile    = { fg = "#e0af68" },
    NvimTreeSpecialFile = { fg = "#7aa2f7" },
    NvimTreeSymlink     = { fg = "#2ac3de" },
    NvimTreeImageFile   = { fg = "#a9b1d6" },
    NvimTreeHighlights  = { fg = "#e0af68" },

    -- NvimTree git status
    NvimTreeGitDirty   = { fg = "#7aa2f7" },
    NvimTreeGitNew     = { fg = "#2ac3de" },
    NvimTreeGitDeleted = { fg = "#e0af68" },
    NvimTreeGitIgnored = { fg = "#6b7280" },
    NvimTreeGitStaged  = { fg = "#9ece6a" },
    NvimTreeGitMerge   = { fg = "#7aa2f7" },
    NvimTreeGitRenamed = { fg = "#2ac3de" },

    -- errors (diagnostic squiggles, virtual text, inline messages)
    DiagnosticError = { fg = "#ff9e64" },
    ErrorMsg        = { fg = "#ff9e64" },
    St_lspError     = { fg = "#ff9e64" },
    -- file tree: bright yellow on files with errors so they're impossible to miss
    NvimTreeDiagnosticErrorFileHL   = { fg = "#ffff00", bold = true },
    NvimTreeDiagnosticErrorFolderHL = { fg = "#ffff00", bold = true },

    -- float windows
    NormalFloat = { fg = "#c0caf5", bg = "#111317" },
    FloatBorder = { fg = "#7aa2f7", bg = "#111317" },
    FloatTitle  = { fg = "#2ac3de", bg = "#111317" },
    Question    = { fg = "#e0af68" },

    -- tabufline (tabs + close buttons)
    TbBufOnClose      = { fg = "#6b7280", bg = "#1c1c1c" },
    TbBufOffModified  = { fg = "#e0af68", bg = "#111317" },
    TbTabOn           = { fg = "#7aa2f7", bg = "#1c1c1c" },
    TbCloseAllBufsBtn = { bold = true, fg = "#ffffff", bg = "#6b7280" },

    -- statusline cwd (folder icon + project name separator)
    St_cwd_icon = { fg = "#000000", bg = "#7aa2f7" },
    St_cwd_sep  = { fg = "#7aa2f7" },

    -- devicons default (shown on unnamed buffers in tabline)
    DevIconDefault  = { fg = "#6b7280" },
    DevIconGo       = { fg = "#7dcfff" },
    DevIconGoMod    = { fg = "#7dcfff" },
    DevIconGoSum    = { fg = "#7dcfff" },
    DevIconGoWork   = { fg = "#7dcfff" },
  },
}

return M
