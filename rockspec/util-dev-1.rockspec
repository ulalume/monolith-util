package = "util"
version = "dev-1"
source = {
   url = "git+https://github.com/ulalume/monolith-util.git"
}
description = {
   homepage = "https://github.com/ulalume/monolith-util",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      ["util.calc_direction"] = "calc_direction.lua",
      ["util.combo_input"] = "combo_input.lua",
      ["util.math2"] = "math2.lua",
      ["util.open_launcher"] = "open_launcher.lua",
      ["util.osname"] = "osname.lua",
      ["util.parse_arguments"] = "parse_arguments.lua",
      ["util.shutdownkey"] = "shutdownkey.lua",
      ["util.storage"] = "storage.lua",
      ["util.table2"] = "table2.lua",
      ["util.timer"] = "timer.lua"
   }
}
