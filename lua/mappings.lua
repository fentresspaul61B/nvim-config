require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- LSP
-- <leader>lr  — restart gopls (clears stale diagnostics)
map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "LSP restart" })
-- <leader>lb  — real `go build` into quickfix (source of truth for errors)
map("n", "<leader>lb", function()
  vim.cmd("cexpr system('go build ./... 2>&1')")
  vim.cmd("copen")
end, { desc = "Go build (quickfix)" })
-- <leader>lx  — wipe all diagnostics in current buffer (clear visual noise)
map("n", "<leader>lx", function()
  vim.diagnostic.reset(nil, vim.api.nvim_get_current_buf())
end, { desc = "Clear buffer diagnostics" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
