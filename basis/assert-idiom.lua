local file, msg
repeat
  print "enter a file name:"
  local name = io.read()
  if not name then return end
  file, msg = io.open(name, "r")
  if not file then print(msg) end
until false

-- assert(io.open(name, "r"))
-- a typical idiom: if io.open fails, assert will raise an error


