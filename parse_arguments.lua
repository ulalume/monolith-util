return function(arg)
  local config = {activeControllers = {true, true, true, true}}
  for i = 1, #arg, 2 do
    if arg[i] == "-c" then
      local controllers = arg[i + 1]
      for k = 1, #controllers do
        config.activeControllers[k] = string.sub(controllers, k, k) == "1"
      end
    end
  end
  return config
end
