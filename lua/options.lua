local opt = vim.opt
local g = vim.g

-- Установка clipboard для использования системного буфера обмена
vim.opt.clipboard = "unnamedplus"

-- Настройка табуляции
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Установка лидера
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Общие полезные настройки
opt.mouse = "a"               -- Включаем мышь
opt.termguicolors = true      -- Поддержка 24-bit цветов
opt.cursorline = true         -- Подсветка текущей строки
opt.wrap = false              -- Не переносить строки
opt.scrolloff = 8             -- Отступ сверху/снизу при скролле
opt.sidescrolloff = 8         -- Отступ слева/справа при скролле
opt.signcolumn = "yes"        -- Постоянно показывать колонку с иконками
opt.splitbelow = true         -- Сплит по горизонтали внизу
opt.splitright = true         -- Сплит по вертикали справа
opt.ignorecase = true         -- Игнорировать регистр при поиске…
opt.smartcase = true          -- …кроме когда есть заглавные
opt.updatetime = 250          -- Быстрый update для LSP / git signs

vim.opt.number = true         -- абсолютный номер для текущей строки
vim.opt.relativenumber = true -- относительные номера для остальных строк

-- Auto Delete Swap
vim.api.nvim_create_autocmd("SwapExists", {
  pattern = "*",
  callback = function()
    vim.v.swapchoice = "d"
  end,
})

-- Auto Save
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and not vim.bo.readonly then
      vim.cmd("silent! write")
    end
  end,
})
