--[[ Break code down to essential lines 
	to incorporate into code

]]
--optional
local joystick, position, speed

function love.load()
	
	-- need
joysticks = love.joystick.getJoysticks()[1]

--[[
      Joysticks is a table of 2 joysticks  
   
	  [1,2] - Joystick works - probably Joystick A & B
	  [2] - phones's accelerometer
	  [#joysticks] - gets the last element in the table  
  
]]
-- need
joystick = joysticks[#joysticks]

-- don't need
position = {
  x = 0, y = 0
}
speed = 500

end
 
function love.update(dt)
	-- may need the whole if conditional
if joystick then
	-- need these 2 lines
axis1, axis2 = joystick:getAxes()
position.x, position.y = position.x + axis1 * speed * dt, position.y + axis2 * speed * dt
end
end


-- Prints a table to console
function printTable(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. printTable(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
function love.draw()
	-- outputs to screen
  love.graphics.print(printTable(joysticks),100,100)
-- don't need  
love.graphics.circle("fill", position.x, position.y, 50)
end