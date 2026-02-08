vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope git_files (equivalent of :GFiles from fzf.vim)
vim.keymap.set("n", "<C-p>", function()
  require("telescope.builtin").git_files()
end, { desc = "Find git files" })
