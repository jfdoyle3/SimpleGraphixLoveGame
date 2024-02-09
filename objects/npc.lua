--[[
	NPC Ojbect
]]
Npc=Object:extend()

function Npc:new()
	self.name=name or "Nemesis"
	self.life = 10
	self.attack = 10
	self.defend = 10
	self.str = 10
	self.dex = 10
	self.state=false
	self.x=350
	self.y=20
	self.speed=500
end

function Npc:update(dt)
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

function Npc:draw()
    love.graphics.draw(self.image, self.x, self.y)
end