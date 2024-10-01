-- plugins/comments.lua
local function setup_comments()
  vim.keymap.set("n", "<leader>/", ":Commentary<CR>")
  vim.keymap.set("v", "<leader>/", ":Commentary<CR>")
end
return{
  "tpope/vim-commentary",
  config = setup_comments
}
