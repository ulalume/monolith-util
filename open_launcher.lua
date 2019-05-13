return function()
  if require "util.osname" == "Linux" then
    local cmd = "/usr/bin/env DISPLAY=:0 /usr/bin/sudo -E /usr/bin/love /home/pi/Desktop/launcher &"
    os.execute(cmd)
  else
    os.execute("/Applications/love.app/Contents/MacOS/love ../launcher &")
  end
end
