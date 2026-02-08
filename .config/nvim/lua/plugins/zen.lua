return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
  },
  config = function()
    require("zen-mode").setup({
      window = { width = 80 },
    })
  end,
}
