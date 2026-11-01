vim.g.mapleader = " "
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { desc = "Open lazygit" })
vim.keymap.set("n", "<leader>lp", ":Lazy<CR>", { desc = "Open lazy.nvim" })

-- Basically allows you to go to definition or decl
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
