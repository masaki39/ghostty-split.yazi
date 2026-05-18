local get_cwd = ya.sync(function()
	return tostring(cx.active.current.cwd)
end)

return {
	entry = function(self, job)
		local cwd = get_cwd()
		local action = (job.args and job.args[1]) or "right"

		local script
		if action == "tab" then
			script = string.format(
				'tell application "Ghostty"\nset cfg to new surface configuration\nset initial working directory of cfg to "%s"\nnew tab in front window with configuration cfg\nend tell',
				cwd
			)
		elseif action == "window" then
			script = string.format(
				'tell application "Ghostty"\nset cfg to new surface configuration\nset initial working directory of cfg to "%s"\nnew window with configuration cfg\nend tell',
				cwd
			)
		else
			script = string.format(
				'tell application "Ghostty"\nset cfg to new surface configuration\nset initial working directory of cfg to "%s"\nset t1 to focused terminal of selected tab of front window\nsplit t1 direction %s with configuration cfg\nend tell',
				cwd,
				action
			)
		end

		local child, err = Command("osascript"):stdin(Command.PIPED):spawn()
		if not child then
			ya.notify({ title = "ghostty-split.yazi", content = tostring(err), level = "error", timeout = 3 })
			return
		end
		child:write_all(script)
		child:flush()
		child:wait()
	end,
}
