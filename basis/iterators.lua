-- *iterator* is contruction that allows you to iterate over the elements of a collection.
-- In Lua, we typically represent iterators by functions:
-- each time we call the function, it returns the "next" elements from
-- the collection.

-- A closure construction typically invovles two functions:
-- the closure itself and a *factory*, the function that creates the
-- colsure plus its enclosing variables.

function values(t)
  local i = 0
  return function() i = i+1; return t[i] end
end

t = {10, 20, 30}

iter = values(t) -- a factory, it creates a new closure.
while true do
  local e = iter()
  if e == nil then break end
  print(e)
end
print()

-- iterator makes it is easiser to use the generic for.
for e in values(t) do
  print(e)
end
print()


for k, v in pairs(t) do print(k, v) end
print()

for i in ipairs(t) do print(i) end
print()



