return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,

        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.golangci_lint,
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

