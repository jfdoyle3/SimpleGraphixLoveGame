--[[
	Marble Object
]]

Marble=Object:extend()

function Marble:new(source, name)
	self.image = love.graphics.newImage("images/energy.png")
	self.name=name or "Marble"
	self.state=false
	self.x=10
	self.y=10
	self.speed=500
	self.width = self.image:getWidth()
	self.height= self.image:getHeight()
	self.input=source
end


--[[
  Love Update function
]]
function Marble:update(dt)

	if self.input=="keyboard" then
		self.x,self.y=keyboardInput(self.x,self.y,self.speed, dt)
	end

	if self.input=="joystick" then
		self.x,self.y=joystickInput(self.x,self.y,self.speed,dt)
	end

	if self.input=="phone" then
		self.x, self.y=phoneInput(self.x,self.y,self.speed,dt)
	end
	--Get the width of the window
	local window_width = love.graphics.getWidth()
	local window_height=love.graphics.getHeight()

--If the left side is too far too the left then..
	if self.x < 0 then
		--Set x to 0
		self.x = 0
	
--Else, if the right side is too far to the right then..
	elseif self.x + self.width > window_width then
		--Set the right side to the window's width.
		self.x = window_width - self.width
	end
--	
	--If the left side is too far too the left then..
	if self.y< 0 then
		--Set x to 0
		self.y = 0

--Else, if the right side is too far to the right then..
	elseif self.y + self.height > window_height then
		--Set the right side to the window's width.
		self.y = window_height - self.height
	end
	
end



-- Love Draw function
function Marble:draw()
	love.graphics.draw(self.image, self.x, self.y)
end


--[[

	Support/External/Custom functions

]]

-- Keyboard Function
function keyboardInput(x,y,speed,time)

	if love.keyboard.isDown("left") then
		x = x - speed * time
	elseif love.keyboard.isDown("right") then
		x = x + speed * time
	end
	
	if love.keyboard.isDown("up") then
		y = y - speed * time
	elseif love.keyboard.isDown("down") then
		y = y + speed * time
	end
	

	return x,y
end



-- Joystick Function
function joystickInput(x,y,speed, time)
	joysticks = love.joystick.getJoysticks()
	joystick = joysticks[1]

	if joystick:isGamepadDown("dpleft") then
		x = x - speed * time
	elseif joystick:isGamepadDown("dpright") then
		x = x + speed * time
	end

	if joystick:isGamepadDown("dpup") then
		y = y - speed * time
	elseif joystick:isGamepadDown("dpdown") then
		y = y + speed * time
	end
	return x,y
end

function phoneInput(x,y,speed,time)
	joysticks = love.joystick.getJoysticks()
	joystick = joysticks[#joysticks]
	axis1, axis2 = joystick:getAxes()
	x, y = x + axis1 * speed * time, y + axis2 * speed * time
	return x,y
end