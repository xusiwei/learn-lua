function raise(message)
  assert(false, message)
end

assert(true, "error message")
raise("error raised!")
