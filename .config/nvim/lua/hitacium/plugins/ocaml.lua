return {
	-- rest of the configurations, omit for simplicity
	require("lazy").setup({
		{
			"stevearc/conform.nvim",
			opts = {
				formatters_by_ft = {
					ocaml = { "ocamlformat" },
				},

				formatters = {
					ocamlformat = {
						prepend_args = {
							--"--if-then-else",
							--"vertical",
							--"--break-cases",
							--"fit-or-vertical",
							--"--type-decl",
							--"sparse",
						},
					},
				},
			},
		}
	})
}
