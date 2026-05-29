---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "carbonfox",
  hl_override = {
    Comment             = { italic = true },
    ["@comment"]        = { italic = true },

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
    ["@keyword.import"]       = { fg = "#e0af68" },
    ["@keyword.import.lua"]   = { fg = "#e0af68" },

    -- functions (all amber — definitions match calls)
    ["@function"]                  = { fg = "#e0af68" },
    ["@function.method"]           = { fg = "#e0af68" },
    ["@function.call"]             = { fg = "#e0af68" },
    ["@function.call.lua"]         = { fg = "#e0af68" },
    ["@function.method.call"]      = { fg = "#e0af68" },
    ["@function.method.call.lua"]  = { fg = "#e0af68" },
    ["@function.builtin"]          = { fg = "#2ac3de" },
    ["@function.builtin.lua"]      = { fg = "#2ac3de" },

    -- module/namespace (e.g. 'inpututil' in inpututil.Method())
    ["@module"]     = { fg = "#e0af68" },
    ["@namespace"]  = { fg = "#e0af68" },

    -- legacy @include (Go parser uses this for package/import)
    ["@include"]    = { fg = "#e0af68" },

    -- Include is what @keyword.import *links to* at runtime — override it so
    -- the link resolves to amber instead of carbonfox's pink base0D
    Include         = { fg = "#e0af68" },

    -- types
    ["@type"] = { fg = "#7aa2f7" },

    -- variables / parameters / constants (names you define)
    ["@variable"]                  = { fg = "#9ece6a" },
    ["@variable.lua"]              = { fg = "#9ece6a" },
    ["@variable.member"]           = { fg = "#7aa2f7" },
    ["@variable.member.lua"]       = { fg = "#7aa2f7" },
    ["@variable.parameter"]        = { fg = "#9ece6a" },
    ["@constant"]                  = { fg = "#9ece6a" },

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
    DevIconDefault = { fg = "#6b7280" },
  },
}

return M
