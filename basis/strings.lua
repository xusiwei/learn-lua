
-- Strings in Lua arg immutable values.
a = "one string"
b = string.gsub(a, "one", "another")  -- change string parts

print(a)  --> one string
print(b)  --> another string


-- # length operator
print(#a)
print(#'hello')
print()



-- escape sequences
--[[
\a   bell
\b   back space
\f   form feed
\n   newline
\r   carriage return
\t   horizontal tab
\v   vertical tab
\\   backslash
\"   double quote
\'   single quote
\ddd 
\x\hh
]]

print("one line\nnext line\n\"in quotes\", 'in quotes'")
print('\x41\x42\x43')
print('\65\97')
print()


-- for long strings
page = [[
<html>
<head>
  <title>An HTML Page</title>
</head>
<body>
  <a href="http://www.lua.org">Lua</a>
</body>
</html>
]]
print(page)

-- special case, `[[` or `]]` in long string
lstr = [=[
`[[` in here, ok
']]' in here, ok
]=]
print(lstr)
print()


-- Lua 5.2 offers \z: 
-- it skips all subsequent characters in the string
-- until the first non-space character
data = "\x41\x42\x43\x44\z
		\x45\x46\x47\x48"
print(data)
