local function checkOS ()
  local os
  local fh, _ = io.popen('uname','r')
  if fh then
    os = fh:read()
  end
  return os
end
local osName = checkOS()
-- "Linux" or "Darwin" or "?"
return osName
