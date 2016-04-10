print(type("Hello"))    --> string
print(type(3.14))       --> number
print(type(1234))       --> number
print(type(print))      --> function
print(type(type))       --> function
print(type(true))       --> boolean
print(type(nil))        --> nil
print(type(X))          --> nil
print(type(type(X)))    --> string, return type of type()


-- Lua is a dynamically typed language
-- any variable can contain values of any type
print()
print(type(a))    --> nil

a = 10
print(type(a))    --> number

a = 'a string!!'
print(type(a))

a = print       -- yes, this is valid!
a(type(a))    --> function
