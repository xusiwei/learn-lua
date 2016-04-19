local iterator  -- to be defined later

function allwords()
  local state = {line = io.read(), pos = 1}
  return iterator, state
end

function iterator(state)
  while state.line do
    local s, e = string.find(state.line, "%w+", state.pos)
    if s then
      state.pos = e + 1
      return string.sub(state.line, s, e)
    else
      state.line = io.read()
      state.pos = 1
    end
  end
  return nil
end


for w in allwords() do
  print(w)
end
