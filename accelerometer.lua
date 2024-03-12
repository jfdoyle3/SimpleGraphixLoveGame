local joystick, position, speed
function love.load()
joysticks = love.joystick.getJoysticks()
--[[
looped = 0
for i in ipairs(joysticks) do
looped = looped + 1
end
]]

--[[
      joysticks is a table
   
   There are 2 joysticks on phone
   1 - joystick
   2 - accelerometer
   
   using # picks the last element in the table
]]
joystick = joysticks[#joysticks]
position = {
  x = 0, y = 0
}
speed = 500

end

function love.update(dt)
if joystick then
axis1, axis2 = joystick:getAxes()
position.x, position.y = position.x + axis1 * speed * dt, position.y + axis2 * speed * dt
end
end

-- Prints a table to console
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
function love.draw()
  love.graphics.print(dump(joysticks),100,100)
love.graphics.circle("fill", position.x, position.y, 50)
end