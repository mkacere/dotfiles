return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      detection_methods = { 'pattern', 'lsp' },
      patterns = { '.git', 'CMakeLists.txt', 'vcpkg.json', 'pyproject.toml', 'Makefile' },
    }

    pcall(function()
      require('telescope').load_extension 'projects'
    end)

    vim.keymap.set('n', '<leader>pp', function()
      local ok_telescope, telescope = pcall(require, 'telescope')
      if not ok_telescope then
        vim.notify('Telescope not available', vim.log.levels.ERROR)
        return
      end

      local ok_actions, actions = pcall(require, 'telescope.actions')
      local ok_state, action_state = pcall(require, 'telescope.actions.state')
      if not ok_actions or not ok_state then
        vim.notify('Telescope actions not available', vim.log.levels.ERROR)
        return
      end

      telescope.extensions.projects.projects {
        attach_mappings = function(prompt_bufnr, _)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)

            if not selection then
              vim.notify('No project selected', vim.log.levels.WARN)
              return
            end

            -- project.nvim telescope entries can vary; try common fields
            local project_path =
              selection.value
              or selection.path
              or (type(selection[1]) == 'string' and selection[1])
              or selection.cwd

            if type(project_path) ~= 'string' or project_path == '' then
              vim.notify('Could not resolve project path from selection', vim.log.levels.ERROR)
              return
            end

            -- Normalize/expand path just in case
            project_path = vim.fn.fnamemodify(project_path, ':p')

            -- Change global cwd (project root)
            vim.cmd('cd ' .. vim.fn.fnameescape(project_path))

            -- Open/focus nvim-tree and force it to the selected project root
            vim.schedule(function()
              local ok_api, api = pcall(require, 'nvim-tree.api')

              if ok_api and api and api.tree then
                -- Open tree if closed, then set root/focus
                if not api.tree.is_visible() then
                  api.tree.open()
                end
                -- Change root to selected project and focus tree
                pcall(api.tree.change_root, project_path)
                pcall(api.tree.focus)
              else
                -- Fallback to commands if API isn't available for some reason
                vim.cmd 'NvimTreeToggle'
                vim.cmd 'NvimTreeFocus'
              end
            end)
          end)

          return true
        end,
      }
    end, { desc = '[P]roject [P]icker' })
  end,
}