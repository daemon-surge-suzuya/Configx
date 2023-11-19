return {

    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        opts.section.header.val = require("user/dashboard-images").pikachu
        
        local button, get_icon = require("astronvim.utils").alpha_button, require("astronvim.utils").get_icon
        opts.section.buttons.val = {
          button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
          button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
          button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
          button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
          button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
          button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
        }
        return opts
      end,
    },
  }