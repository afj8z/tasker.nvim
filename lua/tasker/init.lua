local M = {}
-- Source - https://stackoverflow.com/a
-- Posted by ryadav, modified by community. See post 'Timeline' for change history
-- Retrieved 2025-11-12, License - CC BY-SA 4.0

M.read_file = function(path)
	local file = io.open(path, "rb")
	if not file then
		return nil
	end

	local lines = {}

	for line in io.lines(path) do
		local words = {}
		for word in line:gmatch(".*(!TODO.*)") do
			table.insert(words, word)
			print(word)
		end
		table.insert(lines, words)
	end

	file:close()
	return lines
end

M.read_file("../../test/dict.txt")

return M
