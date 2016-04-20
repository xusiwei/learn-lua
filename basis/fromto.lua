for i = 1, 5 do
  print(i)
end
print()

function fromto(n, m)
  local c = n
  return function()
      local t = c;
      c = c + 1
      return t <= m and t or nil
    end
end

for i in fromto(1, 5) do
  print(i)
end
print()

function range(n, m, s)
  local c = n
  return function()
      local t = c
      s = s or 1
      c = c + s
      return t <= m and t or nil
    end
end

for i = 1, 7, 2 do
  print(i)
end
print()

for i in range(1, 5) do
  print(i)
end
print()

for i in range(1, 7, 2) do
  print(i)
end
print()

