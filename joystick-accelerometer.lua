--[[

	Joystick- accelerometer
	
	trying to get the accelerometer working.

]]


local joystick, position, speed
function love.load()
   joystick = love.joystick.getJoysticks()[1]
   position = {x = 0, y = 0}
   speed = 10

end

function love.update(dt)
   if joystick then
     local axis1, axis2 = joystick:getAxes()
     position.x, position.y = position.x + axis1 * speed * dt, position.y + axis2 * speed * dt
  end
end

function love.draw()
   love.graphics.circle("fill", position.x, position.y, 50)
end