local comboInput = {}

function comboInput:new(input, index, time, key)
  return setmetatable({
    input = input,
    index = index,
    time = time or 4,
    downTime = 0,
    key = key or {"a", "b"},
    down = {}
  }, {__index=self})
end

function comboInput:executable(dt)
  local i = self.index
  local allInputIsDown = true
  for _,k in ipairs(self.key) do
    if self.input:getButton(i,k) then
      self.down[k] = true
    else
      self.down[k] = false
      self.downTime = 0
      allInputIsDown = false
    end
  end

  if allInputIsDown then
    self.downTime = self.downTime + dt
    if self.downTime > self.time then
      self.downTime = self.downTime - self.time
      return true
    end
  end

  return false
end

return comboInput
