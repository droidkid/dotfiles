vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>", { desc = "Find git files" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })

-- Formatting
vim.keymap.set("n", "<leader>f", function() require("conform").format({ async = true }) end, { desc = "Format buffer" })

-- Zen mode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen mode" })
