-- if then
a = -1
if a < 0 then 
  a = 0
end
print(a)
print()


-- if else
print("input a number:")
a = tonumber(io.read())
if a >= 0 then
  print("non-negative")
else 
  print("negative")
end
print()


-- if elseif else
a, b = 5, 3
print("input a operator(+,-,*,/)")
op = io.read()

if op == "+" then
  r = a + b
elseif op == "-" then
  r = a - b
elseif op == "*" then
  r = a * b
elseif op == "/" then
  r = a / b
else
  error("invalid operator")
end
print(a .. op .. b .. '=' .. r)
print()


-- while
a = {1, 2, 3, "hello"}
do local i = 1
  while a[i] do
    print(a[i])
    i = i + 1
  end
end
print()


-- repeat-until
x = 2
local sqr = x/2
repeat
  sqr = (sqr + x/sqr)/2
  local err = math.abs(sqr^2 - x)
until err < x/1000
print(sqr)
print()


-- numberic for
-- for var = start, end, step do
--   <something>
-- end
for i = 2, 5, 2 do
  print(i) 
end
print()


-- decalre a local variable automatically
-- it is visiable only inside the loop
for i = 1, 5 do print(i) end
print(i)  -- nil
print()

do a = {1, 2, 3, nil, 5}; i = 1
  while a[i] do
    print(a[i])
    i = i + 1
  end
end
print()


-- gneric for
days = {"Monday", "Tuesday", "Wednesday",
        "Thursday", "Friday", "Saturday", "Sunday"}
for k, v in pairs(days) do print(k, v) end

revDays = {}
for k, v in pairs(days) do
  revDays[v] = k
end
print()


-- return
function fib(n)
  if n <= 1 then
    return 1
  else
    return fib(n-1) + fib(n-2) 
  end
end
print(fib(4))
print()


-- goto
--
-- label in Lua has the following format:
-- ::lable::
-- 1. and label has the same visiable rules as others
-- 2. cannot jump out of a function

-- continue
do a = {1, 2, 3, 5, 8}; i = 1
  while a[i] do
  if a[i] % 2 ~= 1 then goto continue end
  print(a[i])
  ::continue::
  i = i + 1
  end
end
print()
