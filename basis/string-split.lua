function split(str, sep)
  if str == nil then
    return nil
  end
  sep = sep or '%s'
  local result = {}
  for m in string.gmatch(str, '([^'..sep..']+)') do
    table.insert(result, m)
  end
  return result
end

s = 'a bb ccc ttt d'
t = split(s, ' ')
for i = 1, #t do
  print(t[i])
end
