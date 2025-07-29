return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
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

		require("mason-lspconfig").setup({
			ensure_installed = { "gopls", "ts_ls", "lua_ls", "solargraph" },
			automatic_installation = true,
		})

		local lspconfig = require("lspconfig")
		lspconfig.gopls.setup({})
		lspconfig.ts_ls.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.solargraph.setup({
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

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>rr", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename symbol (Ruby)" })
		vim.keymap.set("n", "<leader>rf", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format Ruby file" })
	end,
}
