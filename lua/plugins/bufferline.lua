return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",            -- показывать буферы (можно "tabs")
        separator_style = "slant",   -- стиль разделителей: "slant", "padded_slant", "thick", "thin"
        numbers = "ordinal",         -- показывать номера буферов
        diagnostics = "nvim_lsp",    -- интеграция с LSP (показывает ошибки на буфере)
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "center",
          },
        },
      },
    })

    -- Горячие клавиши для переключения буферов
    vim.keymap.set("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
    vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
    vim.keymap.set("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })

    vim.keymap.set("n", "<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>")
    vim.keymap.set("n", "<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>")
    vim.keymap.set("n", "<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>")
    vim.keymap.set("n", "<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>")
    vim.keymap.set("n", "<leader>b5", "<Cmd>BufferLineGoToBuffer 5<CR>")
    vim.keymap.set("n", "<leader>b6", "<Cmd>BufferLineGoToBuffer 6<CR>")
    vim.keymap.set("n", "<leader>b7", "<Cmd>BufferLineGoToBuffer 7<CR>")
    vim.keymap.set("n", "<leader>b8", "<Cmd>BufferLineGoToBuffer 8<CR>")
    vim.keymap.set("n", "<leader>b9", "<Cmd>BufferLineGoToBuffer 9<CR>")
  end,
}
