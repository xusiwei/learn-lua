function perm_gen(a, n)
	n = n or #a
	if n <= 1 then
		print(table.unpack(a))
	else
		for i = 1, n do
			a[n], a[i] = a[i], a[n]  -- swap
			perm_gen(a, n-1)
			a[n], a[i] = a[i], a[n]  -- swap
		end
	end
end

perm_gen({1,2,3})
print()

function permutations(a)
	local co = coroutine.create(function() perm_gen(a) end)
	return function()
			local code, res = coroutine.resume(co)
			return res
		end
end

for p in permutations({"a", "b", "c"}) do
	print(table.unpack(p))
end
print()


function perm(a)
	return coroutine.wrap(function() perm_gen(a) end)
end

for p in perm({1, 2, 3}) do
	print(table.unpack(p))
end
