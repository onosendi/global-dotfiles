local api = vim.api

local get_map_options = function(custom_options)
  local options = { noremap = true, silent = true }
  if custom_options then
    options = vim.tbl_extend('force', options, custom_options)
  end
  return options
end

local M = {}

M.buf_map = function(mode, target, source, opts, bufnr)
  api.nvim_buf_set_keymap(bufnr or 0, mode, target, source, get_map_options(opts))
end

M.map = function(mode, mapping, command, options)
  api.nvim_set_keymap(mode, mapping, command, get_map_options(options))
end

M.command = function(name, fn)
  vim.cmd(string.format('command! %s %s', name, fn))
end

M.lua_command = function(name, fn)
  M.command(name, 'lua ' .. fn)
end

M.buf_augroup = function(name, event, fn)
  api.nvim_exec(
    string.format(
      [[
        augroup %s
          autocmd! * <buffer>
          autocmd %s <buffer> %s
        augroup END
      ]],
      name,
      event,
      fn
    ),
    false
  )
end

return M
