-- Visual selection keymaps

require('config.util')

local keymap = vim.keymap.set
local bt = require 'telescope.builtin'
local opts = { noremap = true, silent = true }

keymap('v', '<space><space>', function()
  local text = vim.getVisualSelection()
  bt.current_buffer_fuzzy_find { default_text = text }
end, opts)
keymap('v', '<space>s', function()
  local text = vim.getVisualSelection()
  bt.grep_string { search = text }
end, opts)
