return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				-- Можно добавить кастомные опции, если нужно:
				-- padding = true, -- добавлять пробел после символа комментария
				-- sticky = true,  -- сохранять комментарий при переходе на новую строку
				-- toggler = { line = 'gcc', block = 'gbc' },
				-- opleader = { line = 'gc', block = 'gb' },
				-- mappings = {
				--   basic = true,
				--   extra = true,
				-- },
			})

			-- Горячие клавиши уже по умолчанию:
			-- gcc - комментирует/раскомментирует текущую строку
			-- gc + motion - комментирует выделенный участок (например, gc5j)
			-- gb + motion - комментирует блочный комментарий (если язык поддерживает)
		end,
		desc = "Easy commenting plugin with motions and toggle",
	},
}
