--[[
	Marble Object
]]

Marble=Object:extend()

function Marble:new()
	self.image = love.graphics.newImage("images/energy.png")
	self.name=name or "Marble"
	self.state=false
	self.x=350
	self.y=100
	self.speed=500
	self.width = self.image:getWidth()
	self.input="keyboard"
end

function Marble:update(dt)
	
	
	
	
	

	if self.input=="keyboard" then
		self.x=keyboard(self.x,self.speed, dt)
	end
	
	if self.input=="joystick" then
	-- Joystick function	
	--	self.x=keyboard(self.x,self.speed, dt)
	end
	--Get the width of the window
	local window_width = love.graphics.getWidth()

--If the left side is too far too the left then..
	if self.x < 0 then
		--Set x to 0
		self.x = 0

--Else, if the right side is too far to the right then..
	elseif self.x + self.width > window_width then
		--Set the right side to the window's width.
		self.x = window_width - self.width
	end
end

function keyboard(x,speed,time)

	if love.keyboard.isDown("left") then
		x = x - speed * time
	elseif love.keyboard.isDown("right") then
		x = x + speed * time
	end
	-- need up and down - y axis
	
	return x
end

function joystick(x,speed, time)

	if love.keyboard.isDown("left") then
		x = x - speed * time
	elseif love.keyboard.isDown("right") then
		x = x + speed * time
	end
	return x
end

function Marble:draw()
	love.graphics.draw(self.image, self.x, self.y)
end