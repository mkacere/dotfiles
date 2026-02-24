-- Which-key: shows pending keybinds
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },
    spec = {
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]oggle/Terminal' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>p', group = '[P]roject' },
    },
  },
}
