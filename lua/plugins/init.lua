return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "go", "lua", "vim", "vimdoc", "query",
      },
      highlight = { enable = true },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = { error = "✘", warning = "▲", hint = "⚑", info = "ℹ" },
      },
    },
  },
}
