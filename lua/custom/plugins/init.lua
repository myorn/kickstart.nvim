-- Custom plugins
return {
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'jsx', 'tsx', 'vue', 'svelte', 'xml' },
  },
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Toggle Undotree' },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SplitWidth = 40
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  {
    'jedrzejboczar/possession.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      session_dir = vim.fn.stdpath 'state' .. '/sessions/',
      autosave = {
        current = true,
        cwd = true,
        on_load = true,
        on_quit = true,
      },
      autoload = 'last_cwd',
      prompt_no_cr = true,
      plugins = {
        delete_hidden_buffers = false,
        delete_buffers = true,
      },
    },
    cmd = { 'PossessionSave', 'PossessionLoad', 'PossessionDelete', 'PossessionList' },
    keys = {
      { '<leader>pl', '<cmd>PossessionLoad<CR>', desc = 'Load Session' },
      { '<leader>ps', '<cmd>PossessionSave<CR>', desc = 'Save Session' },
      { '<leader>pd', '<cmd>PossessionDelete<CR>', desc = 'Delete Session' },
      { '<leader>pf', '<cmd>Telescope possession list<CR>', desc = 'Find Session' },
    },
  },

  {
    'nvimdev/indentmini.nvim',
    config = function()
      require('indentmini').setup()
    end,
  },

  {
    'yuukiflow/Arduino-Nvim',
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'arduino',
        callback = function()
          require 'Arduino-Nvim'
        end,
      })
    end,
  },

  {
    'zhisme/copy_with_context.nvim',
    config = function()
      require('copy_with_context').setup {
        mappings = {
          relative = '<leader>cy',
          absolute = '<leader>cY',
          remote = '<leader>cr',
        },
        formats = {
          default = '# {filepath}:{line}',
          remote = '# {remote_url}',
        },
        trim_lines = false,
      }
    end,
  },
}
