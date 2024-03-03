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
end

function Marble:update(dt)
    self.x = self.x + self.speed * dt

    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self.speed = -self.speed
    end
end

function Marble:draw()
    love.graphics.draw(self.image, self.x, self.y)
end