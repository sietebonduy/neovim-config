return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",          -- показывать буферы (можно "tabs")
        separator_style = "slant", -- стиль разделителей: "slant", "padded_slant", "thick", "thin"
        numbers = "ordinal",       -- показывать номера буферов
        diagnostics = "nvim_lsp",  -- интеграция с LSP (показывает ошибки на буфере)
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

    vim.keymap.set("n", "<leader><tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<leader><S-tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
    vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
    vim.keymap.set("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>b" .. i, "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", {
        desc = "Go to buffer # " .. i,
      })
    end
  end,
}
