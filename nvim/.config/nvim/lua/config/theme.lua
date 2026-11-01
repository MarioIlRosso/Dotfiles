local M = {}

-- Setup autocommand so highlights re-apply every time ANY colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Transparency
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

		-- LSP highlights
		vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = "#FF0000", bold = true })
		vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#FFFFFF" })
		vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "#FF0000", italic = true })
		vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly", { fg = "#FF0000" })
	end,
})

function M.set(name)
	vim.cmd.colorscheme(name)

	-- Persist to file
	local f = io.open(vim.fn.stdpath("data") .. "/theme", "w")
	if f then
		f:write(name)
		f:close()
	end
end

function M.load()
	local f = io.open(vim.fn.stdpath("data") .. "/theme", "r")
	local name = f and f:read("*a") or "lackluster"
	if f then f:close() end
	pcall(M.set, name)
end

return M
