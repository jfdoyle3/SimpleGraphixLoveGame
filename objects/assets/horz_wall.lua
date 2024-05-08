	--! file: horz_wall.lua
HorzWall = Object:extend()

function HorzWall:new(x,y,width)
    self.x = x
    self.y = y
	self.height=5
	self.width=width
	self.radius=0
	
end

function HorzWall:update(dt)
		-- add collision here
end

function HorzWall:draw()
    love.graphics.rectangle("fill",self.x, self.y,self.width,self.height,self.radius)
end