return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require("neo-tree")

		neotree.setup(vim.tbl_deep_extend("force", neotree.config or {}, {
			add_blank_line_at_top = false,
			auto_clean_after_session_restore = true,
			close_if_last_window = true,
			default_source = "filesystem",
			enable_diagnostics = true,
			enable_git_status = true,
			enable_modified_markers = true,
			enable_opened_markers = true,
			enable_refresh_on_write = true,
			enable_cursor_hijack = true,
			git_status_async = true,
			git_status_async_options = { batch_delay = 100 },
			hide_root_node = false,
			nesting_rules = {},
			retain_hidden_root_indent = false,
			log_to_file = false,
			open_files_in_last_window = true,
			open_files_do_not_replace_types = {},
			open_files_using_relative_paths = true,
			popup_border_style = "rounded",
			resize_timer_interval = 500,
			sort_case_insensitive = true,
			use_popups_for_input = true,
			use_default_mappings = true,
			source_selector = {
				winbar = true,
				statusline = false,
			},
			renderers = {},
			commands = {},
			buffers = {},
			git_status = {},
			document_symbols = {},
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
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						".git",
						".idea",
						".vscode",
						".DS_Store",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				hijack_netrw_behavior = "open_default",
			},
		}))

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

		vim.keymap.set(
			"n",
			"<leader>e",
			toggle_neo_tree,
			{ noremap = true, silent = true, desc = "Toggle Neo-tree file explorer" }
		)
	end,
}
