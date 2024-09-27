-- plugins/treesitter.lua
local function setup_treesitter()
	local ts = require("nvim-treesitter.configs")
	ts.setup {
		-- A list of parser names, or "all" (the listed parsers MUST always be installed)
		ensure_installed = { "c", "lua", "cpp", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java", "javascript", "python", "rust" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		-- List of parsers to ignore installing (or "all")
		


		highlight = {
			enable = true,


			additional_vim_regex_highlighting = false,
		},
	}
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = setup_treesitter,
}
