-- plugins/telescope.lua
local function setup_telescope()
    local telescope = require('telescope')



    -- Setup telescope with any configuration options you may need
    telescope.setup {}

    -- Require the builtin functions for key mappings
    local builtin = require('telescope.builtin')

    -- Define your key mappings
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find git files' })  -- Corrected description
    vim.keymap.set('n', '<leader>fs', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })  -- Fixed closing parentheses
    end)
   
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',  -- or use branch = '0.1.x'
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = setup_telescope,  -- Call the setup function when the plugin is loaded
}
 
