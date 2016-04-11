-- automatic coercions 
print("10" + 1)           --> 11
print("-5.3e-10" * "2")   --> -1.06e-09


--  .. is the string concatenation operator in Lua
print(10 .. 20)
print(10 ..20)
-- when it right aftera numberal
-- you must separate them with space
-- otherwise, Lua thinks that the first dot is a decimal point

-- concate two string needn't space
print('Hello '..'World')


-- no coercions happened
print(10 == "10")   -- false

-- convert a string to a number explicitly
print(type(tonumber('123')))

-- convert a number to a string
print(tostring(10) == "10")  --> true
print(10 .. "" == "10")      --> trueline = io.read()   -- read a line


print("hello" + 1)  -- ERROR

