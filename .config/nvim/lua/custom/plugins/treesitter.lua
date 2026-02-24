-- Treesitter: syntax highlighting
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    local filetypes = {
      'bash',
      'c',
      'cpp',
      'cmake',
      'css',
      'diff',
      'html',
      'json',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'toml',
      'vim',
      'vimdoc',
      'yaml',
    }
    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
