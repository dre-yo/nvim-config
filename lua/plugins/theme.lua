-- plugins/theme.lua
local function setup_nightfox()    
    -- Setup options for nightfox if supported
    require('nightfox').setup({
        options = {
           transparent = false, -- Set to true if you want a transparent background
	   terminal_colors = true,
            styles = {
                comments = "italic",  -- Example of custom styling
                keywords = "bold",
		types = "italic,bold",
            },
        },
    })
    -- Apply the chosen color scheme directly
    vim.cmd('colorscheme carbonfox')  -- You can change 'nightfox' to 'dayfox', etc.
end

return {
    'EdenEast/nightfox.nvim',
    config = setup_nightfox,  -- Call the setup function when the plugin is loaded
}

