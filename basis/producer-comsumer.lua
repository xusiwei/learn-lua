function receive()
  local status, value = coroutine.resume(producer)
  return value
end

function send(x)
  coroutine.yield(x)
end

producer = coroutine.create(
  function ()
    for i = 1, 10 do
      print("produce", i)
      send(i)
    end
  end)


consumer = coroutine.create(
  function ()
    for i = 1, 10 do
      local x = receive()
      print("consume", x)
    end
  end)

-- In this example, must start consume firstly
-- It's a consumer-driven design
coroutine.resume(consumer)
