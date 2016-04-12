x = 10
local i = 1

while i <= 3 do
  local x = i*2
  print(x)
  i = i + 1
end
print()
print(x)  --> 10
print()

do
  local x = 20
  print(x)
end

foo = "global foo"
do
  local foo = foo
  foo = "local foo"
  print(foo)
end
print(foo)
