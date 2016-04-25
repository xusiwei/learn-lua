-- the error function has an additional second parameter, which gives the
-- *level* where it should report the error, your use this parameter to blame
-- someone else for the error.
function foo(str)
	if type(str) ~= "string" then
		error("string expected")
	end
	print(str)
end


xpcall(function()
	foo({x = 1})
end, function()
	print(debug.traceback())
end)
