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


-- statefull iterators
do
  local generator = function(t)
    local s = 1
    local v = nil
    local g = function()
      v = t[s]
      s = s + 1
      return v
    end
    return g, s, v 
  end

  t = {10, 20, 30, 40, 50}

  for v in generator(t) do print(v) end
  print()

  -- the equivalent the following code:
  local f, s, v = generator(t)
  while true do
    v = f()
    if v == nil then break end
    print(v)
  end
  print()
end


-- stateless iterators
for k, v in next, t do
  print(k, v)
end
print()

function mypairs (t)
  return next, t, nil
end

for k, v in mypairs(t) do
  print(k, v)
end
print()


-- an example 
local function getnext(list, node)
  if not node then
    return list
  else
    return node.next
  end
end

function traverse(list)
  return getnext, list, nil
end

list = nil
for line in io.lines() do
  list = {val = line, next = list}
end
for node in traverse(list) do
  print(node.val)
end


