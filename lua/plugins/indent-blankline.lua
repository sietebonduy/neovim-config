return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#555555" })

      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
          highlight = "IndentBlanklineChar",
        },
        scope = {
          enabled = false,
        },
        exclude = {
          filetypes = { "help", "terminal", "dashboard" },
          buftypes = { "terminal", "nofile" },
        },
      })
    end,
    desc = "Display indentation guides",
  },
}
