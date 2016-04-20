function uniqueWords()
  local dict = {}
  local line = io.read()
  local pos = 1
  return function()
      while line do
        local s, e = string.find(line, '%w+', pos)
        if s then
          pos = e + 1
          word = string.sub(line, s, e)
          if not dict[word] then
            dict[word] = true
            return string.sub(line, s, e)
          end
        else
          line = io.read()
          pos = 1
        end
      end
      return 
    end
end

io.input('a.txt')  -- redirect stdin with `a.txt`
for w in uniqueWords() do
  print(w)
end
