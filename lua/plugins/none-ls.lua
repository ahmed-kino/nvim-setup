return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black.with({
					extra_args = { "--line-length=128" },
				}),
				null_ls.builtins.formatting.isort,
				null_ls.builtins.completion.spell,
				null_ls.builtins.diagnostics.mypy.with({
					extra_args = { "--ignore-missing-imports" },
				}),
				null_ls.builtins.diagnostics.gitlint,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
