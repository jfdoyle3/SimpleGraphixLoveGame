	--! file: vert_wall.lua
VertWall = Object:extend()

function VertWall:new(x,y,height)
    self.x = x
    self.y = y
	self.height=height
	self.width=5
	self.radius=0
	
end

function VertWall:update(dt)

end

function VertWall:draw()
    love.graphics.rectangle("fill",self.x, self.y,self.width,self.height,self.radius)
end