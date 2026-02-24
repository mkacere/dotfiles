-- lua/custom/plugins/nvim-tree.lua
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'File [E]xplorer' },
  },
  opts = {
    filters = { dotfiles = false },
    git = { enable = true, ignore = false },
    view = { width = 35 },
    renderer = {
      group_empty = true,
      icons = { show = { git = true } },
    },
  },
}
