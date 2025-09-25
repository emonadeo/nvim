local cache = {}

local function get_buf_realpath(buf_id)
	return vim.loop.fs_realpath(vim.api.nvim_buf_get_name(buf_id)) or ""
end

local function repo_dir(path)
	local result = vim.system(
		{ "jj", "--ignore-working-copy", "root" },
		{ cwd = vim.fs.dirname(path) }
	)
		:wait()
	if result.code == 0 then
		return vim.trim(result.stdout)
	else
		return nil
	end
end

local function invalidate_cache(buf_id)
	local cache = cache[buf_id]
	if cache == nil then return false end
	pcall(function()
		cache.fs_event:stop()
		cache.timer:stop()
	end)
	cache[buf_id] = nil
end

local function start_watching(buf_id, path)
	local repo = repo_dir(path)
	if repo == nil then return false end
	local watchfile = vim.fs.joinpath(repo, ".jj/working_copy")

	local buf_fs_event, timer = vim.loop.new_fs_event(), vim.loop.new_timer()
	local set_ref_text = function()
		vim.system(
			{ "jj", "--ignore-working-copy", "file", "show", "-r", "@-", '"' .. path .. '"' },
			{ cwd = vim.fs.dirname(path), text = true },
			vim.schedule_wrap(function(res)
				local MiniDiff = require("mini.diff")
				MiniDiff.set_ref_text(buf_id, res.stdout)
			end)
		)
	end

	local watch_index = function(_, filename, _)
		if filename ~= "checkout" then return end
		timer:stop()
		timer:start(50, 0, set_ref_text)
	end
	buf_fs_event:start(watchfile, { recursive = true }, watch_index)

	invalidate_cache(buf_id)
	cache[buf_id] = { fs_event = buf_fs_event, timer = timer }

	set_ref_text()
end

return {
	{
		"nvim-mini/mini.diff",
		version = false,
		opts = {
			view = { style = "sign" },
			mappings = {
				apply = "",
			},
			source = {
				name = "jj",
				attach = function(buf_id)
					if cache[buf_id] ~= nil then return false end

					local path = get_buf_realpath(buf_id)
					if path == "" then return false end

					return start_watching(buf_id, path)
				end,
				detach = function(buf_id) invalidate_cache(buf_id) end,
			},
		},
	},
}
