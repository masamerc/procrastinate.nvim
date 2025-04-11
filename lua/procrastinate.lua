
local function split_commentstring()
    local commentstring = vim.bo.commentstring

    if not commentstring or commentstring == "" then
        return "", ""
    end

    local prefix, suffix = commentstring:match("^(.-)%%s(.-)$")

    if not prefix:match("%s$") then
        prefix = prefix .. " "
    end

    if suffix == nil then
        suffix = ""
    end

    return prefix, suffix
end

local M = {}

M.setup = function()
	-- Automatically create a Vim command to call insert_todo_comment
	vim.api.nvim_create_user_command("InsertTodo", function()
		require("procrastinate").insert_todo_comment()
	end, { desc = "Insert a TODO comment at the current line" })
end

M.insert_todo_comment = function()
	local current_line = vim.api.nvim_get_current_line()
	local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {line, col}
    local prefix, _ = split_commentstring()

	-- Insert TODO comment at the current line and move cursor to the end of it
	local updated_line = current_line .. prefix .. " TODO:  "
	vim.api.nvim_set_current_line(updated_line)

	-- Move the cursor to the position right after "TODO: "
	vim.api.nvim_win_set_cursor(0, { cursor_pos[1], #updated_line })

	-- Enter insert mode
	vim.cmd("startinsert")
end

return M
