vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

vim.schedule(function()
  require("nvim-web-devicons").setup({
    override_by_filename = {
      [".gitignore"] = {
        icon = "",
        color = "#1bf6fa",
        cterm_color = "66",
        name = "GitIgnore",
      },
    },
  })
end)

pcall(dofile, vim.g.base46_cache .. "defaults")
pcall(dofile, vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.opt.cursorline = true
vim.opt.guicursor = "n-v-c:block-Cursor,i:ver25-iCursor"

local function apply_custom_highlights()
  vim.api.nvim_set_hl(0, "Cursor",  { fg = "#000000", bg = "#1bf6fa" })
  vim.api.nvim_set_hl(0, "iCursor", { fg = "#000000", bg = "#1bf6fa" })

  -- comments
  vim.api.nvim_set_hl(0, "Comment",  { fg = "#d3fc03", italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = "#d3fc03", italic = true })

  -- keywords
  vim.api.nvim_set_hl(0, "@keyword",             { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.lua",         { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.function",    { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.function.lua",{ fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.return",      { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.return.lua",  { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.operator",    { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.repeat",      { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.type",        { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.coroutine",   { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.import",       { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@keyword.import.lua",   { fg = "#2ac3de" })

  -- functions (all amber — definitions match calls)
  vim.api.nvim_set_hl(0, "@function",                 { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "@function.method",          { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "@function.call",            { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "@function.call.lua",        { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "@function.method.call",     { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "@function.method.call.lua", { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "@function.builtin",         { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "@function.builtin.lua",     { fg = "#2ac3de" })

  -- module/namespace (e.g. 'inpututil' in inpututil.Method())
  vim.api.nvim_set_hl(0, "@module",     { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "@namespace",  { fg = "#7aa2f7" })

  -- legacy @include (Go parser uses this for package/import)
  vim.api.nvim_set_hl(0, "@include",   { fg = "#e0af68" })
  -- Include is what @keyword.import links to \u2014 override to break the pink link
  vim.api.nvim_set_hl(0, "Include",    { fg = "#e0af68" })

  -- types
  vim.api.nvim_set_hl(0, "@type",         { fg = "#7aa2f7" })

  -- numbers match constant names (both are compile-time fixed values)
  vim.api.nvim_set_hl(0, "@number",       { fg = "#ff9e64" })
  vim.api.nvim_set_hl(0, "@number.float", { fg = "#ff9e64" })

  -- variables / parameters / constants (names you define)
  vim.api.nvim_set_hl(0, "@variable",            { fg = "#fcf003" })
  vim.api.nvim_set_hl(0, "@variable.lua",        { fg = "#fcf003" })
  vim.api.nvim_set_hl(0, "@variable.member",     { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "@variable.member.lua", { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "@variable.parameter",  { fg = "#fcf003" })
  vim.api.nvim_set_hl(0, "@constant",            { fg = "#ff9e64" })

  -- file icons / tree
  vim.api.nvim_set_hl(0, "DevIconGitIgnore",    { fg = "#1bf6fa" })
  vim.api.nvim_set_hl(0, "NvimTreeExecFile",    { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "NvimTreeSymlink",     { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "NvimTreeImageFile",   { fg = "#a9b1d6" })
  vim.api.nvim_set_hl(0, "NvimTreeHighlights",  { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "Question",            { fg = "#e0af68" })

  -- git status in tree
  vim.api.nvim_set_hl(0, "NvimTreeGitDirty",   { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "NvimTreeGitNew",      { fg = "#2ac3de" })
  vim.api.nvim_set_hl(0, "NvimTreeGitDeleted",  { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "NvimTreeGitIgnored",  { fg = "#6b7280" })
  vim.api.nvim_set_hl(0, "NvimTreeGitStaged",   { fg = "#9ece6a" })
  vim.api.nvim_set_hl(0, "NvimTreeGitMerge",    { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "NvimTreeGitRenamed",  { fg = "#2ac3de" })

  -- errors
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff9e64" })
  vim.api.nvim_set_hl(0, "ErrorMsg",        { fg = "#ff9e64" })
  vim.api.nvim_set_hl(0, "St_lspError",     { fg = "#ff9e64" })

  -- float windows
  vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#c0caf5", bg = "#111317" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "#111317" })
  vim.api.nvim_set_hl(0, "FloatTitle",  { fg = "#2ac3de", bg = "#111317" })

  -- tabufline (tabs + close buttons)
  vim.api.nvim_set_hl(0, "TbBufOnClose",      { fg = "#6b7280", bg = "#1c1c1c" })
  vim.api.nvim_set_hl(0, "TbBufOffModified",  { fg = "#e0af68", bg = "#111317" })
  vim.api.nvim_set_hl(0, "TbTabOn",           { fg = "#7aa2f7", bg = "#1c1c1c" })
  vim.api.nvim_set_hl(0, "TbCloseAllBufsBtn", { bold = true,    fg = "#ffffff",  bg = "#6b7280" })

  -- statusline cwd (folder icon + project name separator)
  vim.api.nvim_set_hl(0, "St_cwd_icon", { fg = "#000000", bg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "St_cwd_sep",  { fg = "#7aa2f7" })

  -- gitsigns delete markers (pink dash blocks in gutter)
  vim.api.nvim_set_hl(0, "GitSignsDelete",      { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "GitSignsTopdelete",   { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#e0af68" })

  -- devicons default icon (shown on unnamed buffers in tabline)
  vim.api.nvim_set_hl(0, "DevIconDefault", { fg = "#6b7280" })
  vim.api.nvim_set_hl(0, "DevIconGo",      { fg = "#7dcfff" })
  vim.api.nvim_set_hl(0, "DevIconGoMod",   { fg = "#7dcfff" })
  vim.api.nvim_set_hl(0, "DevIconGoSum",   { fg = "#7dcfff" })
  vim.api.nvim_set_hl(0, "DevIconGoWork",  { fg = "#7dcfff" })
end

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    vim.defer_fn(apply_custom_highlights, 100)
  end,
})

-- Re-apply after lazy.nvim finishes loading all plugins (treesitter's dofile
-- runs during plugin load and can overwrite our highlight overrides).
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = apply_custom_highlights,
})

-- keyword background highlight groups (defined early so matchadd always finds them)
vim.api.nvim_set_hl(0, "HlFunctionalCore",  { bg = "#ffc800", fg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "HlImperativeShell", { bg = "#03fcf0", fg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "HlTodo",            { bg = "#03fc84", fg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "HlAction",          { bg = "#fcf003", fg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "HlDead",            { bg = "#ff8903", fg = "#000000", bold = true })

local kw_matches = {
  { group = "HlFunctionalCore",  pattern = "FunctionalCore\\|TRANSFORMATION\\|Pure" },
  { group = "HlImperativeShell", pattern = "ImperativeShell\\|SIDE_EFFECT\\|SideEffect" },
  { group = "HlTodo",            pattern = "TODO" },
  { group = "HlAction",          pattern = "ACTION\\|CAPTURE" },
  { group = "HlDead",            pattern = "DEAD" },
}

local function apply_kw_matches()
  local existing = {}
  for _, m in ipairs(vim.fn.getmatches()) do
    existing[m.group] = true
  end
  for _, kw in ipairs(kw_matches) do
    if not existing[kw.group] then
      vim.fn.matchadd(kw.group, kw.pattern)
    end
  end
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
  callback = apply_kw_matches,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
    -- NvimTree reshuffles windows; apply matches to all windows once settled
    vim.schedule(function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        vim.api.nvim_win_call(win, apply_kw_matches)
      end
    end)
  end,
})

-- Refresh NvimTree diagnostics when LSP clears or updates errors.
-- Debounced: waits 1500ms after the last change so gopls has time to settle.
local _diag_timer = nil
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    if _diag_timer then
      vim.fn.timer_stop(_diag_timer)
    end
    _diag_timer = vim.fn.timer_start(1500, vim.schedule_wrap(function()
      _diag_timer = nil
      local ok, api = pcall(require, "nvim-tree.api")
      if ok then api.tree.reload() end
    end))
  end,
})
