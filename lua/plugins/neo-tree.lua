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
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    })

    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end,
}
