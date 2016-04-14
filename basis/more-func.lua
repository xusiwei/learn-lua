-- first-class values
p = print
q = p
q("hello")
print()

a = {p = print}
a.p("Hello World")
print = math.sin
a.p(print(1))
sin = a.p
sin(10, 20)   --> 10  20
print = a.p
print()


function foo(x) return 2*x end
print(foo(12))
-- just a syntacitc sugar
foo = function(x) return 2*x end
print(foo(12))


-- table.sort
a = {3, 5, 2, 1, 0, 7, 4}
print(table.unpack(a))
table.sort(a)
print(table.unpack(a))
print()

a = {"bar", "fo", "accept", "users"}
table.sort(a)
print(table.unpack(a))
table.sort(a, function(i, j) return #i < #j end)
print(table.unpack(a))
print()



-- closure
function derivative(f, delta)
  delta = delta or 1e-6
  return function(x)
           return (f(x + delta) - f(x)) / delta
         end
end

c = derivative(math.sin)
print(math.cos(5.2), c(5.2))
print()

-- lexical scoping:
-- a function enclosed in another function,
-- it has full access to local variables from the enclosing function.

function newCounter()
  local i = 0
  return function()   -- anonymous function
           i = i + 1
           return i
         end
end

c1 = newCounter()
print(c1())  --> 1
print(c1())  --> 2

c2 = newCounter()
print(c2())  --> 1
print(c1())  --> 3
print(c2())  --> 2
print()


-- store function in table fields
Lib = {
  foo = function(x, y) return x + y end,
  goo = function(x, y) return x - y end
}
print(Lib.foo(2, 3), Lib.goo(2, 3))
print()


-- local functions
-- store function in local variables
do
  local f = function() end
  print(f)
  do
    local f = function() end
    print(f)
  end
  print(f)
end

print(f)
do
  -- a syntacitc sugar for local funtion
  local function f()  end
  print(f)
end
print(f)
print()


---[[
fact = function(n) print("global fact"); return n; end
local fact = function(n)
  if n == 0 then return 1
  else return n * fact(n-1)  -- buggy,
  end
  -- when complies, the local fact is not yet defined
end
print(fact(4))  --> 12
--]]

-- aviod that problem
local fact
fact = function(n)
  if n <= 1 then return 1
  else return n * fact(n-1)
  end
end
print(fact(4))  --> 24


-- tail recursive
-- the program does not need to keep any information
-- about the calling function in the stack.

function foo(n)
	if n > 0 then return foo(n-1) end
end
foo(12345678)
-- tail-call elimination


function f(x) return (x > 0) and f(x) or x end
-- print(f(12345678))  -- stack overflow


-- In Lua, only a call with the form `return func(args)` is a tail call.
--
-- is a tail call:
-- return x[i].foo(x[j] + a*b, i + j)
--
-- not a tail call:
-- return g(x) + 1   -- must do the addition
-- return x or g(x)  -- must adjust to 1 result
-- return (g(x))     -- must adjust to 1 result

