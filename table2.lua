local table2 = {}

table2.removeItem = function(t, item)
  for i,v in ipairs(t) do
    if item==v then
      table.remove(t,i)
      return i
    end
  end
  return nil
end

table2.merge = function (t, ...)
  local args = {...}
  t = t or {}
  if #args == 0 then return t end
  for _,v in ipairs(args[1]) do
    table.insert(t, v)
  end
  table.remove(args, 1)
  table.insert(args, 1, t)
  return table2.merge(unpack(args))
end

table2.indexOf = function (t, v)
  for i,v2 in ipairs(t) do
    if v == v2 then return i end
  end
  return nil
end

table2.copy = function (org)
  local t = {}
  for k, v in pairs(org) do
    t[k] = v
  end
  return t
end

return table2
