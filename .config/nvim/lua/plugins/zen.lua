return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup({
      window = { width = 80 },
    })
  end,
}
