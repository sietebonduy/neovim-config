return {
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,                                 -- интеграция с treesitter для умного добавления пар
        disable_filetype = { "TelescopePrompt", "vim" }, -- где не использовать автопары
        fast_wrap = {
          map = "<M-e>",                                 -- горячая клавиша для быстрого обёртывания
          chars = { "{", "[", "(", '"', "'" },
          pattern = [=[[%'%"%>%]%)%}%,]]=],
          offset = 0,
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "Search",
          highlight_grey = "Comment",
        },
      })

      -- Интеграция с nvim-cmp (автодополнение)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
    desc = "Automatic insertion of pairs like (), {}, '', \"\" etc.",
  },
}
