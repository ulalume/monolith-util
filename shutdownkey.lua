local shutdownkey = {}

function shutdownkey:new(input, time)
  return setmetatable(
  {
    input = input,
    time = time or 4,
    downTime = {0, 0, 0, 0},
    key = {{false,false}, {false,false}, {false,false}, {false,false}}
  }, {__index=self})
end


function shutdownkey:update(dt)
  for i=1,4 do
    if self.input:getButtonDown(i, "a") then
      self.key[i][0] = true
    end
    if self.input:getButtonDown(i, "b") then
      self.key[i][1] = true
    end

    if self.input:getButtonUp(i, "a") then
      self.key[i][0] = false
      self.downTime[i] = 0
    end
    if self.input:getButtonUp(i, "b") then
      self.key[i][1] = false
      self.downTime[i] = 0
    end

    if self.key[i][0] and self.key[i][1] then
      self.downTime[i] = self.downTime[i] + dt
    end
    if self.downTime[i] > self.time then
      love.event.quit()
    end
  end
end

return shutdownkey
