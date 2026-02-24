-- Autoformat
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function() require('conform').format { async = true, lsp_format = 'fallback' } end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      if ft == 'c' or ft == 'cpp' then
        return { timeout_ms = 500, lsp_format = 'never' }
      else
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      python = { 'ruff_format', 'black', stop_after_first = true },
    },
    -- Use clang-format from your LLVM install (C:\Program Files\LLVM\bin)
    formatters = {
      ['clang-format'] = {
        command = vim.fn.has 'win32' == 1 and 'C:/Program Files/LLVM/bin/clang-format.exe' or 'clang-format',
      },
    },
  },
}
