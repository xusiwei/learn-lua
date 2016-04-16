function integral(f, delta)
  delta = delta or 1e-6
  return function(a, b)
           local sum, count = 0, (b-a) / delta
           for i = 1, count do
             sum = sum + f(a + i*delta)*delta
           end
           return sum
         end
end

f = function(x) return x end
g = integral(f)
print(g(0, 1))


function polynomial(a)
  return function(x)
           local sum = 0
           for i = 1, #a do
             sum = sum * x
             sum = sum + a[i]
           end
           return sum
         end
end
f = polynomial({3, 0, 1})
print(f(0))   --> 1
print(f(5))   --> 76
print(f(10))  --> 301

-- TODO: write a program that performs an unbounded call chain without recursion

