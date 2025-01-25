return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Форматтеры
        null_ls.builtins.formatting.stylua,    -- Lua
        null_ls.builtins.formatting.prettier,  -- JavaScript, TypeScript, CSS, HTML, JSON, etc.
        null_ls.builtins.formatting.rubocop,   -- Ruby
        null_ls.builtins.formatting.gofmt,     -- Go
        null_ls.builtins.formatting.goimports, -- Go (импорты)

        -- Линтеры
        null_ls.builtins.diagnostics.rubocop,       -- Ruby
        null_ls.builtins.diagnostics.eslint_d,      -- JavaScript, TypeScript
        null_ls.builtins.diagnostics.golangci_lint, -- Go
      },
    })

    vim.keymap.set('n', '<leader>ff', function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format file" })

    vim.keymap.set('n', '<leader>fl', function()
      vim.diagnostic.open_float()
    end, { desc = "Show lint errors" })
  end,
}
