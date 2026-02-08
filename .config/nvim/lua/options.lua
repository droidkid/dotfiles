local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true

opt.number = true
opt.relativenumber = true

opt.foldmethod = "manual"
opt.cursorline = true
opt.termguicolors = true

opt.diffopt:append("vertical")

-- Makefiles need tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 0
  end,
})
