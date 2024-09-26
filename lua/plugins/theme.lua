-- plugins/theme.lua
local function setup_nightfox()
    -- Apply the chosen color scheme directly
    vim.cmd('colorscheme carbonfox')  -- You can change 'nightfox' to 'dayfox', etc.
    
    -- Setup options for nightfox if supported
    require('nightfox').setup({
        options = {
           transparent = true, -- Set to true if you want a transparent background
            styles = {
                comments = "italic",  -- Example of custom styling
                keywords = "bold",
            },
        },
    })
end

return {
    'EdenEast/nightfox.nvim',
    config = setup_nightfox,  -- Call the setup function when the plugin is loaded
}

