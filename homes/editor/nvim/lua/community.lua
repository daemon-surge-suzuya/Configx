-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.git/git-blame-nvim", enabled = true }, 
  { import = "astrocommunity.utility/noice-nvim", enabled = true },
  { "andweeb/presence.nvim",
  config = function()
   require("presence").setup({
      auto_update = true, 
      neovim_image_text = "The One True Text Editor", 
      main_image = "neovim", -- Main image display (either "neovim" or "file")
      client_id = "1149376179988594698",
      log_level = nil, 
      debounce_timeout = 10,
      enable_line_number = false, 
      blacklist = {},
      buttons = true,
      file_assets = {}, 
      show_time = true, 
      -- Rich Presence text options
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s", 
      git_commit_text = "Committing changes", 
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s", 
      line_number_text = "Line %s out of %s", 
  })
  
  end,
  
  },
}
