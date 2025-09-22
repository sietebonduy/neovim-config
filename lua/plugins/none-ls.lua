return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,

        null_ls.builtins.diagnostics.rubocop,
        -- null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.golangci_lint,
      },

      on_attach = function(client, bufnr)
        local supports_formatting = (
          vim.lsp.client_supports_method and vim.lsp.client_supports_method(client, "textDocument/formatting")
        ) or (client.supports_method and client:supports_method("textDocument/formatting"))

        if supports_formatting then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>ff", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format file" })

    vim.keymap.set("n", "<leader>fl", function()
      vim.diagnostic.open_float()
    end, { desc = "Show lint errors" })
  end,
}
