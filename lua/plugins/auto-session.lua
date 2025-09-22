return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "info",
      auto_session_enable_last_session = true, -- восстанавливать последнюю сессию при старте
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = true,                                                    -- автоматически сохранять сессию при выходе
      auto_restore_enabled = true,                                                 -- автоматически восстанавливать сессию при запуске
      pre_save_cmds = { "lua vim.lsp.stop_client(vim.lsp.get_active_clients())" }, -- если нужно остановить LSP перед сохранением
    })
  end,
}
