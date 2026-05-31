require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      gofumpt = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

vim.lsp.enable("gopls")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    -- auto-add/remove imports via gopls
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" }, diagnostics = {} }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    -- then format
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
