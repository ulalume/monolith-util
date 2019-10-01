local math2 = {}
math2.__index = math2

function getRectangle(p0x, p0y, p1x, p1y)
    return {
        left = math.min(p0x, p1x),
        right = math.max(p0x, p1x),
        top = math.min(p0y, p1y),
        bottom = math.max(p0y, p1y),
    }
end

function math2.round(value)
    return math.floor(value + 0.5)
end

function math2.clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    end
    return value
end

function math2.lerp(a, b, ratio)
  return (a * ratio) + b * (1.0 - ratio)
end

function math2.map(value, srcMin, srcMax, dstMin, dstMax)
    return dstMin + (dstMax - dstMin) * ((value - srcMin) / (srcMax - srcMin))
end

function math2.length(px, py)
    return math.sqrt((px * px) + (py * py))
end


function math2.intersectionTwoRectangles(
        p0x, p0y, p1x, p1y,
        p2x, p2y, p3x, p3y)
    local r0 = getRectangle(p0x, p0y, p1x, p1y)
    local r1 = getRectangle(p2x, p2y, p3x, p3y)
    return not (r1.left > r0.right
        or r1.right < r0.left
        or r1.top > r0.bottom
        or r1.bottom < r0.top)
end

function math2.intersectionTwoLineSegments(
        p0x, p0y, p1x, p1y,
        p2x, p2y, p3x, p3y)
    local s1x = p1x - p0x
    local s1y = p1y - p0y
    local s2x = p3x - p2x
    local s2y = p3y - p2y

    local s = (-s1y * (p0x - p2x) + s1x * (p0y - p2y))
        / (-s2x * s1y + s1x * s2y)
    local t = (s2x * (p0y - p2y) - s2y * (p0x - p2x))
        / (-s2x * s1y + s1x * s2y)

    if s >= 0.0 and s <= 1.0 and t >= 0.0 and t <= 1.0 then
        return p0x + (t * s1x), p0y + (t * s1y)
    end
    return nil, nil
end

function math2.dotProduct(p0x, p0y, p1x, p1y)
    return p0x * p1x + p0y * p1y
end

function math2.isNaN(_v)
    return _v ~= _v
end

function math2.reflectPoint(
        p0x, p0y, p1x, p1y,
        p2x, p2y, p3x, p3y)

    -- intersection point
    local cx, cy = math2.intersectionTwoLineSegments(
            p0x, p0y, p1x, p1y,
            p2x, p2y, p3x, p3y)
    if cx == nil or cy == nil then
        return nil
    end

    -- cal two lines angle
    local aa = {
        x = p1x - p0x,
        y = p1y - p0y,
    }
    local bb = {
        x = p3x - p2x,
        y = p3y - p2y,
    }
    local rad = math.acos(
        math2.dotProduct(aa.x, aa.y, bb.x, bb.y)
        / (math2.length(aa.x, aa.y) * math2.length(bb.x, bb.y)))

    -- normal
    local na = { x = -aa.y, y = aa.x }
    local mna = math2.length(na.x, na.y)
    local dotbn = math2.dotProduct(bb.x, bb.y, na.x, na.y)
    if dotbn > 0 then mna = -mna end
    na.x, na.y = na.x / mna, na.y / mna

    -- distance
    local d2 = 2
        * math2.length(p3x - cx, p3y - cy)
        * math.sin(rad)

    return
        p3x + (na.x * d2),
        p3y + (na.y * d2),
        cx, cy
end

return math2
