return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      -- Toggle these if you want later
      transparent = false,
      italic_comments = false,
      hide_fillchars = false,

      -- Keep integrations simple for now
      borderless_pickers = true,
    }

    -- Change only this line when switching to another installed colorscheme
    vim.cmd.colorscheme 'cyberdream'
  end,
}
