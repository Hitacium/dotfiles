return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function ()
			vim.cmd.colorscheme "catppuccin-macchiato"
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require("lualine").setup({
				options = {
					theme = "auto",
				},
			})
		end
	}
}
