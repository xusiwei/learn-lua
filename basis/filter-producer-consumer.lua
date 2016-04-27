function receive(prod)
	local status, value = coroutine.resume(prod)
	return value
end

function send(x)
	coroutine.yield(x)
end

function producer()
	return coroutine.create(function ()
			for i = 1, 10 do
				local x = i
				print("produce "..x)
				send(x)
			end
		end)
end

function filter(prod)
	return coroutine.create(function ()
			for i = 1, 10 do
				local x = receive(prod)
				x = string.format("filter-%d", i, x)
				send(x)
			end
		end)
end

function consumer(prod)
	for i = 1, 10 do
		local x = receive(prod)
		print("cosume "..x)
	end
end

consumer(filter(producer()))
