local socket = require("socket")

function download(host, file)
	local c = assert(socket.connect(host, 80))
	c:send("GET".. file .. " HTTP/1.0\r\n\r\n")
	while true do
		local s, status, partial = c:receive(2^10)
		io.write(s or partial)
		if status == "closed" then break end
	end
	c:close()
end


threads = {}

function get(host, file)
	local co = coroutine.create(function()
		download(host, file)
	end)
	table.insert(threads, co)
end

function dispatch()
	local i = 1
	while true do
		if threads[i] == nil then
			if threads[1] == nil then break end
			i = 1
		end
		local status, res = coroutine.resume(threads[i])
		if not res then
			table.remove(threads, i)
		else
			i = i + 1
		end
	end
end

host = "www.w3.org"

get(host, "/TR/html401/html40.txt")
get(host, "/TR/REC-html32.html")

dispatch()
