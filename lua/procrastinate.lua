local default_config = {
  file_type_comment_chars_map = {
    lua =  "--",
    sh = "#",
    go = "//",
    rust = "//",
    python = "#",
    c = "//",
    cpp = "//",
    js = "//",
    css = "/*",
    scss = "/*",
  }
}

local config = {}

local function setup(user_config)
  -- Merge user config with default config
  config = vim.tbl_deep_extend('force', default_config, user_config or {})

  -- Automatically create a Vim command to call insert_todo_comment
  vim.api.nvim_create_user_command('InsertTodo', function()
    require('procrastinate').insert_todo_comment()
  end, { desc = 'Insert a TODO comment at the current line' })
end

local function insert_todo_comment()
  local current_line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {line, col}

  -- Get the current file type
  local current_file_type = vim.bo.filetype
  local comment_id = config.file_type_comment_chars_map[current_file_type] or "--" -- default to "--" if no match

  -- Insert TODO comment at the current line and move cursor to the end of it
  local updated_line = current_line .. " " .. comment_id .. " TODO:  "
  vim.api.nvim_set_current_line(updated_line)

  -- Move the cursor to the position right after "TODO: "
  vim.api.nvim_win_set_cursor(0, { cursor_pos[1], #updated_line })
  -- Enter insert mode
  vim.cmd('startinsert')
end

return {
  setup = setup,
  insert_todo_comment = insert_todo_comment
}
