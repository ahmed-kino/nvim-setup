return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- Find references for the word under your cursor.
			-- NOTE: This should be in telescope
			-- vim.keymap.set("n", "gr", vim.lsp.buf.lsp_references, {})
			-- NOTE: This is moved to telescope
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
			-- Diagnostic keymaps
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
			-- Highlight when yanking (copying) text
			--  Try it with `yap` in normal mode
			--  See `:help vim.highlight.on_yank()`
			vim.api.nvim_create_autocmd("TextYankPost", {
				desc = "Highlight when yanking (copying) text",
				group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
				callback = function()
					vim.highlight.on_yank()
				end,
			})
		end,
	},
}
