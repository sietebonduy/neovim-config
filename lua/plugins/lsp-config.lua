return {
  {
    "williamboman/mason.nvim",
    version = "*",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",  -- Lua
          "ts_ls",   -- TypeScript/JavaScript
          "eslint",  -- ESLint для JS/TS
          "gopls",   -- Go
          "solargraph", -- Ruby (в том числе Rails)
          "jsonls",  -- JSON
          "html",    -- HTML
          "cssls",   -- CSS
          "yamlls",  -- YAML
          "ruby_lsp", -- Ruby (альтернативный LSP)
          "dockerls", -- Dockerfile
          "bashls",  -- Bash
          "terraformls", -- Terraform
          "prismals", -- Prisma ORM (TS)
          "vimls",   -- Vim script
          "marksman", -- Markdown
          "sqlls",   -- SQL
          "intelephense", -- PHP
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "lua_ls",
          "stylua",  -- форматтер Lua
          "prettier", -- форматтер для JS/TS/HTML/CSS
          "eslint_d", -- быстрый ESLint
          "rubocop", -- Ruby форматтер и линтер
          "goimports", -- Go импорт организатор
          "solargraph", -- Ruby LSP сервер
          "terraform-ls", -- Terraform LSP сервер
          "shellcheck", -- Bash линтер
          "shfmt",   -- Bash форматтер
          "hadolint", -- Dockerfile линтер
          "marksman", -- Markdown LSP
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)
      end

      -- Lua
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim", "require" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({ on_attach = on_attach })

      -- ESLint (для diagnostics)
      lspconfig.eslint.setup({ on_attach = on_attach })

      -- Go
      lspconfig.gopls.setup({ on_attach = on_attach })

      -- Ruby (Solargraph)
      lspconfig.solargraph.setup({ on_attach = on_attach })

      -- Ruby (alternative ruby-lsp)
      lspconfig.ruby_lsp.setup({ on_attach = on_attach })

      -- JSON
      lspconfig.jsonls.setup({ on_attach = on_attach })

      -- HTML
      lspconfig.html.setup({ on_attach = on_attach })

      -- CSS
      lspconfig.cssls.setup({ on_attach = on_attach })

      -- YAML
      lspconfig.yamlls.setup({ on_attach = on_attach })

      -- Dockerfile
      lspconfig.dockerls.setup({ on_attach = on_attach })

      -- Bash
      lspconfig.bashls.setup({ on_attach = on_attach })

      -- Terraform
      lspconfig.terraformls.setup({ on_attach = on_attach })

      -- Prisma
      lspconfig.prismals.setup({ on_attach = on_attach })

      -- Vim script
      lspconfig.vimls.setup({ on_attach = on_attach })

      -- Markdown
      lspconfig.marksman.setup({ on_attach = on_attach })

      -- SQL
      lspconfig.sqlls.setup({ on_attach = on_attach })

      -- PHP
      lspconfig.intelephense.setup({ on_attach = on_attach })
    end,
  },
}
