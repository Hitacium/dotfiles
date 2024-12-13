return {
	{
		"olimorris/onedarkpro.nvim",
		config = function () 
			vim.cmd("colorscheme onedark_vivid")
		end
	},
	{
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require("lualine").setup({
                options = {
                    theme = "onedark",
                },
            })
        end
    }
}
