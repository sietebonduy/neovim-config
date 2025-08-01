return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "gopls", "ts_ls", "lua_ls", "solargraph" },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    -- Функция для keymaps, которая будет вызываться при подключении LSP к буферу
    local on_attach = function(client, bufnr)
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      -- Можно добавить другие полезные команды, например:
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    end

    -- Настройка каждого LSP сервера
    lspconfig.gopls.setup({
      on_attach = on_attach,
    })
    lspconfig.ts_ls.setup({
      on_attach = on_attach,
    })
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    lspconfig.solargraph.setup({
      on_attach = on_attach,
    })
  end,
}
