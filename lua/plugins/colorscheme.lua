return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,    -- Загружать сразу при старте
  priority = 1000, -- Высокий приоритет
  config = function()
    require("catppuccin").setup({
      -- Настройки Catppuccin (опционально)
      flavour = "frappe",            -- Вариант цветовой схемы: latte, frappe, macchiato, mocha
      transparent_background = true, -- Прозрачный фон
      term_colors = true,            -- Поддержка терминальных цветов
      styles = {
        comments = { "italic" },     -- Стиль комментариев
        conditionals = { "italic" }, -- Стиль условий
      },
      integrations = {
        telescope = true,                           -- Интеграция с Telescope
        nvimtree = true,                            -- Интеграция с NvimTree
        cmp = true,                                 -- Интеграция с nvim-cmp
        dap = { enabled = true, enable_ui = true }, -- Интеграция с DAP
        mason = true,                               -- Интеграция с Mason
        treesitter = true,                          -- Интеграция с Treesitter
        which_key = true,                           -- Интеграция с WhichKey
      },
    })

    -- Установка цветовой схемы
    vim.cmd.colorscheme("catppuccin")
  end,
}
