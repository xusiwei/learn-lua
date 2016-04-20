function allwords(f)
  for line in io.lines() do
    f(line)
  end
end

-- allwords(print)
local count = 0
allwords(function (w)
  if w == 'hello' then count = count + 1 end
end)
print(count)
