--[[
	Player Ojbect
]]

Player=Object:extend()

function Player:new()
	self.image = love.graphics.newImage("images/player.png")
	self.name=name or "Hero"
	self.life = 10
	self.attack = 10
	self.defend = 10
	self.str = 10
	self.dex = 10
	self.state=false
	self.x=300
	self.y=100
	self.speed=500
end
function Player:keyPressed(key)
    --If the spacebar is pressed
    if key == "space" then
        --Put a new instance of Bullet inside listOfBullets.
     --   table.insert(listOfBullets, Bullet(self.x, self.y))
    end
end

function Player:update(dt)
	if love.keyboard.isDown("left") then
		self.x = self.x - self.speed * dt
	elseif love.keyboard.isDown("right") then
		self.x = self.x + self.speed * dt
	end

	--Get the width of the window
--	local window_width = love.graphics.getWidth()

--If the left side is too far too the left then..
	if self.x < 0 then
		--Set x to 0
		self.x = 0

--Else, if the right side is too far to the right then..
--[[	elseif self.x + self.width > window_width then
		--Set the right side to the window's width.
		self.x = window_width - self.width]]
	end

end

function Player:draw()
	love.graphics.draw(self.image, self.x, self.y)
end
