local json = require "rxi-json-lua"
local storage = {}

function storage:load(file, global)
  if global == nil then global = false end
  local this = setmetatable({file = file or "storage.json", global=global}, {__index=self})

  local old
  if global then
    old = love.filesystem.getIdentity()
    love.filesystem.setIdentity("__global__")
  end
  local string = love.filesystem.read(this.file)
  if global then
    love.filesystem.setIdentity(old)
  end

  if string == nil then
    this.data = {}
    this:save()
  else
    this.data = json.decode(string)
  end

  return this
end


function storage:save()
  local old
  if self.global then
    old = love.filesystem.getIdentity()
    love.filesystem.setIdentity("__global__")
  end
  local success, message = love.filesystem.write(self.file, json.encode(self.data))
  if self.global then
    love.filesystem.setIdentity(old)
  end

  if not success then print(message) end
end

return storage
