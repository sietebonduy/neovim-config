return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>f1", "<cmd>Telescope find_files<cr>", {
				noremap = true,
				silent = true,
				desc = "Find files",
			})
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {
				noremap = true,
				silent = true,
				desc = "Live grep",
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
