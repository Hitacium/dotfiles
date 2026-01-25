return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				python = { "isort", "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				ocaml = { "ocamlformat" },
				tex = { "latexindent" },
				typst = { "typstyle" },
				sql = { "sqlfmt" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<F3>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
