-- functions are first-class values in Lua:
-- programs can store functions in variables,
-- pass functions as arguments to other functions,
-- and return functions as results.

-- if the function has one single argument
-- and that argument is either a literal string 
-- or a table constructor, then the parentheses are optional:
print "Hello, World"  -- same as print("Hello, World")
print [[a multi-line
        message]]
dofile 'hello.lua'

print(type {})
print()


function add(a)
  local sum = 0
  for i = 1, #a do
    sum = sum + a[i]
  end
  return sum
end

print(add({1,2,3,4,5}))


function p(a, b) print(a, b) end
p(3)
p(3, 4)
p(3, 4, 5)  --> 5(discarded)
print()


-- Lua function can return multiple values
s, e = string.find("hello Lua users", "Lua")
print(s, e)
print()


function foo() return 'a', 'b' end
x = foo()
print(x)
x, y = foo()
print(x, y)
x, y, z = foo()
print(x, y, z)  -- nil for missing
print()


-- a special function
print(table.unpack({10, 20, 30, 40}))
print()
-- An important use for unpack is in a generic call mechanism.
-- A generic call mechanism allows you to call any function,
-- with any arguments, dynamically.


print(table.unpack({"Mon", "Tue", "Wed", "Tur", "Fri"}, 2, 3))


function unpack(t, i, n)
  i = i or 1
  n = n or #t
--  print("unpack ".. i ..','.. n)
  if i <= n then
    return t[i], unpack(t, i+1, n)
  end
end

print(unpack({1, 2, 3, 4}))
print(unpack({1, 2, 3, 4}, 2))
print(unpack({1, 2, 3, 4}, 2, 3))
print()


-- variadic function
--  it can receive a variable number of arguments.
function add(...)
  local s = 0
  for i, v in ipairs{...} do
    s = s + v
  end
  return s
end
print(add(1, 2, 3, 4))
print()

function raw(...) return ... end
function count(...) return #{...} end
print(raw(1, 2, 3, 4, 5))
print(count(1, 2, 3, 4, 5))
print()


function printf(fmt, ...)
  return io.write(string.format(fmt, ...)) 
end
-- printf()   -- ERROR, bad argument #1 to 'format' (string expected, got nil)
printf("a\n")
printf("%d-%d\n", 4, 5)
print()


-- table.pack(...)
-- likes {...}, but also an extra field `n`, with the total number of arguments.
function nonil(...)
  local arg = table.pack(...)
  for i = 1, arg.n do
    if arg[i] == nil then return false end
  end
  return true
end
print(nonil(2,3,nil))  --> false
print(nonil(2,3))      --> true
print(nonil())         --> true
print(nonil(nil))      --> false
print()

-- however, that {...} is cleaner and faster than table.pack(...)



-- named arguments
-- Lua match function arguments positionally
-- so you need a bit of trick to achive this goal
function strfind(arg)
  return string.find(arg.src, arg.tag)
end

print(strfind{src="hello Lua users", tag="Lua"})
print()

