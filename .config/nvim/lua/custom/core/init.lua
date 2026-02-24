-- custom/core.lua

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- You installed JetBrainsMono Nerd Font
vim.g.have_nerd_font = true

-- [[ Setting options ]]
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- [[ Basic Keymaps ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = true,
  virtual_lines = false,
  jump = { float = true },
}
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>tt', function()
  local dir = vim.fn.expand '%:p:h'
  local height = math.floor(vim.o.lines / 4)
  vim.cmd('lcd ' .. dir)
  vim.cmd('botright split | resize ' .. height)
  vim.cmd 'terminal'
end, { desc = '[T]erminal in file dir' })

vim.keymap.set('n', '<leader>tr', function()
  local root = vim.fn.getcwd()
  local height = math.floor(vim.o.lines / 4)
  vim.cmd('lcd ' .. root)
  vim.cmd('botright split | resize ' .. height)
  vim.cmd 'terminal'
end, { desc = '[T]erminal in project [R]oot' })

-- New lines without entering insert mode
vim.keymap.set('n', '<leader>o', 'o<Esc>', { desc = 'New line below' })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { desc = 'New line above' })

-- Split navigation with CTRL+hjkl
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
