return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "fade_in_slide_out", -- анимация появления и исчезания
        timeout = 3000,               -- время показа уведомления (мс)
        max_width = 50,
        max_height = 10,
        background_colour = "#1e222a",
        fps = 30,
      })

      vim.notify = notify
    end,
    desc = "Fancy notification manager with animations",
  },
}
