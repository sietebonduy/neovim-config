return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"akinsho/git-conflict.nvim",
		config = true,
		event = "BufReadPre",
	},
	{
		"NeogitOrg/neogit",
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
		end,
		dependencies = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
	},
}
