-- Tables are the main(in fact, the only) data structuring mechansim in Lua
-- Tables in Lua are neither values nor variables; they are *objects*.
-- You can create tables by *constructor expression*.
a = {}
print(type(a))

k = "x"
a[k] = 10        -- new entry, with key="x" and vlaue=10
a[20] = "great"  -- new entry, with key=20  and value="great"
print(a["x"])    --> 10

k = 20
print(a[k])    --> great

a["x"] = a["x"] + 1
print(a["x"])  --> 11
print()


a = {}
a["x"] = 10
b = a           -- `b` refers to the same table as `a`
print(b["x"])   --> 10

b["x"] = 20
print(a["x"])   --> 20

a = nil  -- only `b` still refers to the table
b = nil  -- no references left to the table
-- when no more references to a table, Lua's garbage collector will
-- eventually delete the table and reuse its memory.
print()



-- table can store values with different types of keys and values
a = {}
-- create 1000 new entries
for i = 1, 1000 do a[i] = i*2 end
print(a[9])  --> 18
a["x"] = 10
a[true] = "bool"
print(a["x"])   --> 10
print(a[true])  --> 20
print(a["y"])   --> nil
print(a[false]) --> nil
print()


-- a.name as syntactic sugar for a["name"]
a.x = 10
print(a.x)
print(a["x"])
print(a.y)
print()


-- don't confuse a.x with a[x]
a = {}
x = "y"
a[x] = 10
print(a[x])   --> 10
print(a.x)    --> nil
print(a.y)    --> 10
print()


-- 
a = {}
for i = 1, 10 do
	a[i] = 2*i
end
-- the list does not have *holes*, which are nil elements inside it.
-- we call such a list without holes a sequence.

-- for sequence, Lua offers length operator `#`
-- it returns the last index, or the length of the sequence
print(#a)
for i = 1, #a do
	print(i, a[i])
end
print()

-- as default, Lua use 1...n as table indices
a = {"The", "Lua", "Programming", "Language"}
for i = 1, #a do
	print(i, a[i])
end
print()


-- We can index a table with any type.
-- When in doubt about the actual types of your indices,
-- use an explicit conversion to be sure:
i = 10; j = "10"; k = "+10"
a = {}
a[i] = "one value"
a[j] = "another value"
a[k] = "yet another value"
print(a[i])
print(a[j])
print(a[k])
print(a[tonumber(j)])
print(a[tonumber(k)])



