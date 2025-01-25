return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Интеграция с LSP
    "neovim/nvim-lspconfig",             -- Настройка LSP
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Настройка mason-lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = { "gopls", "ts_ls", "lua_ls", "solargraph" }, -- Добавлен solargraph
      automatic_installation = true,                                   -- Автоматическая установка LSP-серверов
    })

    -- Настройка LSP-серверов
    local lspconfig = require("lspconfig")
    lspconfig.gopls.setup({})    -- Настройка для Go
    lspconfig.ts_ls.setup({})    -- Настройка для TypeScript
    lspconfig.lua_ls.setup({})   -- Настройка для Lua
    lspconfig.solargraph.setup({ -- Настройка для Ruby
      cmd = { "solargraph", "stdio" },
      filetypes = { "ruby" },
      root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
      settings = {
        solargraph = {
          diagnostics = true,
          completion = true,
          formatting = true,
          useBundler = true,
        },
      },
    })

    -- Ключевые команды
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', '<leader>rr', function()
      vim.lsp.buf.rename()
    end, { desc = "Rename symbol (Ruby)" })
    vim.keymap.set('n', '<leader>rf', function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format Ruby file" })
  end,
}
