-- global variable do not need declarations, you simply use them.
-- It's not an error to access a non-initialized variable.
print(a)  --> nil
a = 10
print(a)  --> 10


b = nil -- assign nil to a global variable,
-- Lua behaves as if the variable had never been used.
