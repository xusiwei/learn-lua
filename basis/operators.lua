-- arithmetic
a = 13
b = 2
print(a + b)
print(a - b)
print(a * b)
print(a / b)
print(a % b)
print(a ^ b)
print()


x = 3.14
print(x % 1)    --> 0.14
print(x - x%1)  --> integer part

angle = 270
angle = angle%180
print(angle)

rads = 3/2*math.pi
rads = rads % (2*math.pi)
print(rads)

print()



-- relational
-- <   >  <=  >=  ==  ~=
a = 3; b = 2
print(a < b)
print(a > b)
print(a <= b)
print(a >= b)
print(a == b)
print(a ~= b)
print()

-- Lua compares strings in alphabetical order
print("ace" < "act")
print("2" < "15")
print(2 < 15)
print()

-- about ==  ~=
-- If the values have different types, Lua considers them not equal.
-- Lua compares tables and userdata by reference
a = {}; a.x = 1; a.y = 0
b = {}; b.x = 1; b.y = 0
c = a
print(a == b)  --> false
print(a == c)  --> true
print("end relation operators\n")



-- Logical
-- all logical operators consider both the boolean false and nil as false
-- anything else as true.

-- not operator always return a boolean value:
print(not nil)   --> true
print(not false) --> true
print(not 0)     --> false, 0 is true, only false and nil are false
print(not not 1) --> true
print(not not nil) --> false
print()


-- and operator returns its first argument if it is false, 
-- otherwise returns its second.
print(4 and 5)      --> 5
print(nil and 13)   --> nil
print(false and 13) --> false
print()

-- or operator returns its first argument if it is true;
-- otherwise return its second.
print(4 or 5)       --> 4 
print(false or 5)   --> 5
print()


-- both `and` and `or` use short-cut evaluation, that is
-- they evaluate their second operand only when necessary.
v = nil
print(type(v) == "table" and v.tag == h1)
print()


-- useful Lua idiom:
--    x = x or v
-- is equivalent to:
--   if not x then x = v end
x = nil; v = "foo"
x = x or v
print(x)

x = nil; v = "foo"
if not x then x = v end
print(x)
print()


-- another idiom:
--    (a and b) or c,  or simply   a and b or c
-- is equivalent to C expresion:
--    a ? b : c
x = 3; y = 5
max = (x > y) and x or y
print(max)



-- string concatenation
print("Hello ".."World")


-- Length operator
a = {"Welcome", "to", "Lua", "World"}
print(a[#a])

a[#a] = nil   -- removes the last value
print(a[#a])

a[#a+1] = "!" -- append to the end
print(a[#a])
print()


a = {}
a[1] = 1
a[2] = nil  -- dose nothing, as a[2] is already nil
a[3] = 1
a[4] = 1
print(#a)  --> 4

a = {1, nil, 1, 1}
print(#a)  --> 4

a = {}
a[1] = 1
a[10000] = 1
print(#a)  --> 1

a = {10, 20, 30, nil, nil}
print(#a)  --> 3
print()


--Precedence(higher to lower):
--[[
^
not #  - (unary)
*   /    %
+	 -
..
<	>	<=	>=	~=	==
and
or
]]


-- {} Table constuctor
-- list-style
a = {"Monday", "Tuesday", "Wednesday",
	 "Thursday", "Friday", "Saturday", "Sunday"}
print(a[5])

-- recore-style:
a = {x=10, y=20}
print(a.x, a.y)

a = {}; a.x = 10; a.y = 20
print(a.x, a.y)
print()

-- we can mix record-style and list-style
polyline = {color = "blue",
			thickness = 2,
			npoints = 4,
			{x = 0,   y = 0},  -- polyline[1]
			{x = -10, y = 0},  -- polyline[2]
			{x = -10, y = 1},  -- polyline[3]
			{x = 0,   y = 1},  -- polyline[4]
			}
print(polyline[2].x)  --> -10
print(polyline[4].y)  --> 1


opnames = {["+"] = "add", ["-"] = "sub",
           ["*"] = "mul", ["/"] = "div"}
print(opnames["*"])
print()

a = {'r', 'g', 'b'}
for i = 1, #a do print(i, a[i]) end
print()

a = {[1]='r', [2]='g', [3]='b', } -- a comma after last entry is valid
for i = 1, #a do print(i, a[i]) end
print()

-- use semicolon instead comma is also valid 
a = {x = 10, y = 45; "one", "two", "three"}
