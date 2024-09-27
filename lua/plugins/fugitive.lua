-- plugins/fugitive.lua
local function setup_fugitive()
	vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
end
return {
	"tpope/vim-fugitive",
	config = setup_fugitive
}
