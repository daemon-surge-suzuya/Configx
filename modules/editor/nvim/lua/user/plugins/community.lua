return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.git/git-blame-nvim" },
  { import = "astrocommunity.utility/noice-nvim" },
  { import = "astrocommunity.colorscheme.nightfox-nvim"},
  { import = "astrocommunity.colorscheme.kanagawa-nvim"},
  { import = "astrocommunity.colorscheme.rose-pine" },


  {
    "noice.nvim",
    opts = function(_, opts)
      opts.presets.bottom_search = false
      opts.lsp.signature = { enabled = false }
      return opts
    end,
  },
}