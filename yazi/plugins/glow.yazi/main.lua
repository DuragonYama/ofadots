local M = {}
local cache = {}

function M:peek(job)
	local url = tostring(job.file.url)

	if not cache[url] then
		local child = Command("glow")
			:arg({ "--style", "dark", "--width", tostring(job.area.w), url })
			:env("CLICOLOR_FORCE", "1")
			:stdout(Command.PIPED)
			:stderr(Command.PIPED)
			:spawn()

		if not child then
			return require("code"):peek(job)
		end

		local lines = {}
		while true do
			local line, event = child:read_line()
			if event ~= 0 then break end
			lines[#lines + 1] = line
		end
		child:start_kill()

		if #lines == 0 then
			return require("code"):peek(job)
		end

		cache[url] = lines
	end

	local all_lines = cache[url]
	local limit = job.area.h
	local from = job.skip + 1
	local to = math.min(from + limit - 1, #all_lines)
	local visible = table.concat(all_lines, "", from, to)

	ya.preview_widget(job, ui.Text.parse(visible):area(job.area))
end

function M:seek(job)
	local h = cx.active.current.hovered
	if not h or h.url ~= job.file.url then
		return
	end
	ya.emit("peek", {
		math.max(0, cx.active.preview.skip + job.units),
		only_if = job.file.url,
	})
end

return M
