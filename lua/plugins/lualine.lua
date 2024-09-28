-- plugins/lualine.lua
local function setup_lualine()
  require('lualine').setup{
    options = {
      theme = 'codedark',
    }
  }
end
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = setup_lualine
}
}
