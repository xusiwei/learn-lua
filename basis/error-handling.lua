-- if you need to handle errors in Lua,
-- you must usethe pcall(protected call)
-- function to encapsulate your code.

n = tonumber(io.read())

function fact(n)
  if n <= 1 then return 1 end
  return n * fact(n-1)
end

local ok, msg = pcall(function()
  if n < 0 then error("n must be positive") end
end)

if ok then
  print("fact(".. n .."):".. fact(n))
else
  print("error raised: ".. msg)
end

-- These mechanisms provide all we need to do exception handling in Lua.
-- We throw an exception with `error` and catch it with `pcall`.
-- The error message identifies the kind of error.
