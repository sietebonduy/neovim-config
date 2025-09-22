return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,                -- высота терминала в горизонтальном режиме
        open_mapping = [[<c-\>]], -- клавиша для открытия/закрытия терминала (Ctrl+\)
        shade_terminals = true,   -- затемнение терминала
        shading_factor = 2,       -- степень затемнения
        start_in_insert = true,   -- начинать в режиме вставки
        persist_size = true,      -- запомнить размер терминала
        direction = "horizontal", -- направление: horizontal, vertical, float, tab
        close_on_exit = true,     -- закрывать терминал при выходе из shell
        shell = vim.o.shell,      -- использовать дефолтный shell
      })

      -- Горячие клавиши для toggle терминала
      vim.api.nvim_set_keymap(
        "n",
        "<leader>t",
        "<cmd>ToggleTerm<CR>",
        { noremap = true, silent = true, desc = "Toggle terminal" }
      )

      -- Быстрый выход из режима терминала в нормальный режим
      vim.api.nvim_set_keymap(
        "t",
        "<Esc>",
        [[<C-\><C-n>]],
        { noremap = true, silent = true, desc = "Exit terminal mode" }
      )
    end,
  },
}
