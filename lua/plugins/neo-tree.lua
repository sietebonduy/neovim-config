return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			sources = { "filesystem", "buffers", "git_status" },
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
			},
			window = {
				width = 30,
				mappings = {
					["<C-e>"] = "close_window",
					["<CR>"] = "open",
					["l"] = "open",
					["h"] = "close_node",
					["r"] = "rename",
					["a"] = "add",
					["d"] = "delete",
					["R"] = "refresh",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
				follow_current_file = true,
				hijack_netrw_behavior = "open_default",
			},
		})

		local function toggle_neo_tree()
			local manager = require("neo-tree.sources.manager")
			local state = manager.get_state("filesystem")

			if state and state.winid and vim.api.nvim_win_is_valid(state.winid) then
				local current_win = vim.api.nvim_get_current_win()
				if current_win == state.winid then
					vim.cmd("Neotree close")
				else
					vim.api.nvim_set_current_win(state.winid)
				end
			else
				vim.cmd("Neotree toggle")
			end
		end

		vim.keymap.set("n", "<leader>e", toggle_neo_tree, { noremap = true, silent = true })
	end,
}
