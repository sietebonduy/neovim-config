return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "gopls", "ts_ls", "lua_ls", "solargraph" },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    lspconfig.gopls.setup({})
    lspconfig.ts_ls.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.solargraph.setup({})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  end,
}

