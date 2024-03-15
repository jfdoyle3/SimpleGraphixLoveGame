--[[
	Marble Object
]]

Marble=Object:extend()

function Marble:new(source, name)
	self.image = love.graphics.newImage("images/energy.png")
	self.name=name or "Marble"
	self.state=false
	self.x=350
	self.y=100
	self.speed=500
	self.width = self.image:getWidth()
	self.input=source
end

--[[ Need to initalize Joystick and choose the input.
  if not joystick then return end
  Love Update function
]]
function Marble:update(dt)

	if self.input=="keyboard" then
		self.x=keyboard(self.x,self.speed, dt)
	end

	if self.input=="joystick" then
		-- Joystick function	
		--	self.x=keyboard(self.x,self.speed, dt)
	end
	
	if self.input=="phone" then
		self.x, self.y=phone(self.x,self.y,self.speed,dt)
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



-- Love Draw function
function Marble:draw()
	love.graphics.draw(self.image, self.x, self.y)
end


--[[

	Support/External/Custom functions

]]

-- Keyboard Function
function keyboard(x,speed,time)

	if love.keyboard.isDown("left") then
		x = x - speed * time
	elseif love.keyboard.isDown("right") then
		x = x + speed * time
	end
	-- need up and down - y axis

	return x
end



-- Joystick Function
function joystick(x,speed, time)
   

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

function phone(x,y,speed,time)
	axis1, axis2 = joystick:getAxes()
	x, y = x + axis1 * speed * time, y + axis2 * speed * time
	return x,y
end