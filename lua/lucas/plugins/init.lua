return {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-telescope/telescope.nvim", version = '*' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { "rebelot/kanagawa.nvim" },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = true
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) 
    },
}
