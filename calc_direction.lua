local names={"right","up","left","down"}
local direction={right=1,up=2,left=3,down=4}
local directionPlus={0,2,3,1}
return function (index, key)
  local d = direction[key]
  if d == nil then return key end
  return names[((d + directionPlus[index] - 1) % 4) + 1]
end
