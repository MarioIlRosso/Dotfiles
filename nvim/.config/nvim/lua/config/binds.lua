vim.g.mapleader = " "
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { desc = "Open lazygit" })
vim.keymap.set("n", "<leader>lp", ":Lazy<CR>", { desc = "Open lazy.nvim" })

-- Basically allows you to go to definition or decl
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- Introducing Super Fast Keybinds (SFKs).

-- Basically a macro for SFKs, automatically goes in insert mode and exits.
-- Also adds an insert mode variant
local function set_sfk(trigger, action)
	vim.api.nvim_set_keymap("n", "fk" .. trigger, "i" .. action .. "<Esc>", { noremap = true, silent = true })
end

-- Testing SFK.
set_sfk("t", "SFKs work!")

-- Rust
set_sfk("rd", "#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord, Hash, Default)]")
set_sfk("rfsv", "let s: &'static str = match self {}")
set_sfk("rfsvf", "let s: &'static str = match self { _ => ... }")
