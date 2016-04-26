co = coroutine.create(function() print("hi") end)
-- coroutine does not run its body automatically when we create it.


print(type(co))  --> thread

print(coroutine.status(co))  --> suspended
-- four state: suspended, running, dead, normal


-- change its state from suspended to running
coroutine.resume(co)  --> hi
print()


-- the power of coroutine -- yield
co = coroutine.create(function()
      for i = 1, 10 do
        print("co", i)
        coroutine.yield()
      end
    end)

coroutine.resume(co)         --> co 1
print(coroutine.status(co))  --> suspended


coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))
coroutine.resume(co); print(coroutine.status(co))

print(coroutine.resume(co))
print()


-- passing data to coroutine
co = coroutine.create(function (a, b, c)
      print("co", a, b, c+2) 
    end)
coroutine.resume(co, 1, 2, 3)  --> co 1 2 5
print()

-- from coroutine
co = coroutine.create(function ()
      return 6, 7
    end)
print(coroutine.resume(co))
print()


-- multi entry
co = coroutine.create(function (a, b)
      coroutine.yield(a + b, a - b)
    end)
print(coroutine.resume(co, 20, 10))


co = coroutine.create(function (x)
      print("co1", x)
      print("co2", coroutine.yield())
    end)
coroutine.resume(co, "hi")
coroutine.resume(co, 4, 5)


-- asymmetric coroutine
-- It has a function got suspend the execution of a coroutine(yield)
-- and a different function to resume a suspended coroutine(resume).

