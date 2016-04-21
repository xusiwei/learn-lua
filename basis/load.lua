f = load('i = i + 1')
-- like this:
-- f = function() i = i + 1 end

i = 1
print(i)       --> 1
f(); print(i)  --> 2
f(); print(i)  --> 3
print()


-- follow code show the difference
i = 32
local i = 0
f = load("i = i + 1; print(i)")
g = function() i = i + 1; print(i) end
f()   --> 33
g()   --> 1
print()
-- f manipulates the global i
-- because `load` always complies its chunks in the global enviroment


f = load('local a = 10; print(a + 20)')
f()   --> 30


p = load('print(...)')
p(1, 2, 3)




