local grep_string = function()
	vim.ui.input({ prompt = " Grep > " }, function(value)
		require("telescope.builtin").grep_string({ search = value })
	end)
end

return grep_string
