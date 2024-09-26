-- plugins/theme.lua
local function setup_nightfox()
    -- Setup options for nightfox if supported
    require('nightfox').setup({
        options = {
            transparent = false,  -- Set to true if you want a transparent background
            terminal_colors = true,
            styles = {
                comments = "italic",              -- Italic comments for readability
                conditionals = "bold",            -- Bold conditionals to make them stand out
                constants = "NONE",               -- Default style for constants
                functions = "bold,italic",        -- Functions to stand out
                keywords = "bold",                -- Bold keywords for emphasis
                numbers = "NONE",                 -- Default style for numbers
                operators = "NONE",               -- Default style for operators
                strings = "italic",               -- Italic strings for emphasis
                types = "bold",                   -- Bold types for visibility
                variables = "NONE",               -- Default style for variables
            },
        },
    })

    -- Apply the chosen color scheme directly
    vim.cmd('colorscheme carbonfox')  -- You can change 'carbonfox' to 'nightfox', 'dayfox', etc.
end

return {
    'EdenEast/nightfox.nvim',
    config = setup_nightfox,  -- Call the setup function when the plugin is loaded
}

