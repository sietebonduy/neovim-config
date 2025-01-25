return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin", -- Цветовая схема
        icons_enabled = true, -- Включить иконки
        component_separators = { left = "", right = "" }, -- Разделители компонентов
        section_separators = { left = "", right = "" }, -- Разделители секций
        disabled_filetypes = { "neo-tree", "neo-tree-popup", "alpha" }, -- Отключить Lualine для Neo-Tree
      },
      sections = {
        lualine_a = { "mode" },                               -- Режим
        lualine_b = { "branch", "diff", "diagnostics" },      -- Ветка, изменения, диагностика
        lualine_c = { "filename" },                           -- Имя файла
        lualine_x = { "encoding", "fileformat", "filetype" }, -- Кодировка, формат файла, тип файла
        lualine_y = { "progress" },                           -- Прогресс
        lualine_z = { "location" },                           -- Положение курсора
      },
      inactive_sections = {
        lualine_a = {}, -- Неактивные секции
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree", "fugitive" }, -- Расширения для интеграции с Neo-Tree
    })
  end,
}
