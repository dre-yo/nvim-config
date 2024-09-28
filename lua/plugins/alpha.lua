-- plugins/alpha.lua
local function setup_alpha()
  require'alpha'.setup(require'alpha.themes.dashboard'.config)
end
return {
    {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = setup_alpha
  },
}
