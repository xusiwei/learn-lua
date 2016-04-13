s = tonumber(io.read())
if s == 2 then
  goto block2
elseif s == 3 then
  goto block3
elseif s == 4 then
  goto block4
end

::block1::
---[[
while true do
  print("while")
end
--]]


::block2::
---[[
repeat
  print("repeat")
until false
--]]


::block3::
---[[
::before::
print("goto")
goto before
--]]


::block4::
---[[
for i = 1, 1, 0 do
  print("for-" .. i)
end
--]]
