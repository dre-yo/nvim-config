-- plugins/harpoon.lua

local function setup_harpoon()
	local harpoon = require("harpoon")

	-- REQUIRED
	harpoon:setup()
	-- REQUIRED

	vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
	vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  vim.keymap.set("n", "<S-Left>", function() harpoon.list():select(1) end)
  vim.keymap.set("n", "<S-Down>", function() harpoon.list():select(2) end)
  vim.keymap.set("n", "<S-Up>", function() harpoon.list():select(3) end)
  vim.keymap.set("n", "<S-Right>", function() harpoon.list():select(4) end)

	-- Toggle previous & next buffers stored within Harpoon list
	vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
	vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
end
return{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = setup_harpoon
}
