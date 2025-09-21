return {
  {
    "williamboman/mason.nvim",
    version = "*",
    config = function()
      require("mason").setup()
    end,
    desc = "UI for managing LSP, DAP, linters, and formatters",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    dependencies = {
      {
        "williamboman/mason.nvim",
        desc = "Backend for installing LSP and other tools",
      },
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",       -- Lua
          "ts_ls",        -- TypeScript/JavaScript
          "eslint",       -- JS/TS linter
          "gopls",        -- Go
          "solargraph",   -- Ruby
          "jsonls",       -- JSON
          "html",         -- HTML
          "cssls",        -- CSS
          "yamlls",       -- YAML
          "ruby_lsp",     -- Alternative Ruby LSP
          "dockerls",     -- Dockerfile
          "bashls",       -- Bash
          "terraformls",  -- Terraform
          "prismals",     -- Prisma
          "vimls",        -- Vimscript
          "marksman",     -- Markdown
          "sqlls",        -- SQL
          "intelephense", -- PHP
        },
        automatic_installation = true,
      })
    end,
    desc = "Auto install and configure LSP servers via mason",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      {
        "williamboman/mason.nvim",
        desc = "Installer manager for LSP/format/lint tools",
      },
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "lua_ls",
          "stylua",       -- Lua formatter
          "prettier",     -- JS/TS/HTML/CSS formatter
          "eslint_d",     -- Fast JS/TS linter
          "rubocop",      -- Ruby linter/formatter
          "goimports",    -- Go import organizer
          "solargraph",   -- Ruby LSP
          "terraform-ls", -- Terraform LSP
          "shellcheck",   -- Bash linter
          "shfmt",        -- Bash formatter
          -- "hadolint", -- Dockerfile linter
          "marksman",     -- Markdown
        },
      })
    end,
    desc = "Automatic install of external CLI tools via mason",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        desc = "Manager for LSP and other dev tools",
      },
      {
        "williamboman/mason-lspconfig.nvim",
        desc = "Bridge between mason and lspconfig",
      },
    },
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", unpack(bufopts) })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", unpack(bufopts) })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", unpack(bufopts) })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions", unpack(bufopts) })
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, { desc = "Format buffer", unpack(bufopts) })

        -- Register which-key descriptions (optional, if using which-key.nvim)
        local wk = require("which-key")
        wk.register({
          ["<leader>rn"] = "Rename symbol",
          ["<leader>ca"] = "Code actions",
          ["<leader>f9"] = "Format buffer",
          ["gd"] = "Go to definition",
          ["K"] = "Hover documentation",
        }, { buffer = bufnr })
      end

      -- Setup servers
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

      lspconfig.ts_ls.setup({ on_attach = on_attach })
      lspconfig.eslint.setup({ on_attach = on_attach })
      lspconfig.gopls.setup({ on_attach = on_attach })
      lspconfig.solargraph.setup({ on_attach = on_attach })
      lspconfig.ruby_lsp.setup({ on_attach = on_attach })
      lspconfig.jsonls.setup({ on_attach = on_attach })
      lspconfig.html.setup({ on_attach = on_attach })
      lspconfig.cssls.setup({ on_attach = on_attach })
      lspconfig.yamlls.setup({ on_attach = on_attach })
      lspconfig.dockerls.setup({ on_attach = on_attach })
      lspconfig.bashls.setup({ on_attach = on_attach })
      lspconfig.terraformls.setup({ on_attach = on_attach })
      lspconfig.prismals.setup({ on_attach = on_attach })
      lspconfig.vimls.setup({ on_attach = on_attach })
      lspconfig.marksman.setup({ on_attach = on_attach })
      lspconfig.sqlls.setup({ on_attach = on_attach })
      lspconfig.intelephense.setup({ on_attach = on_attach })
    end,
    desc = "Configure and connect LSP servers via lspconfig",
  },
}
