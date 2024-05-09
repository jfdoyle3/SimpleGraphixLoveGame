	--! file: horz_wall.lua
HorzWall = Object:extend()

function HorzWall:new(x,y,width)
    self.x = x
    self.y = y
	self.height=5
	self.width=width
	self.radius=0
	
end

function HorzWall:update(collidedWallX,object,dt)

	if collidedWallX then 
		-- print ("wall: X: "..tostring(marble.x).." | Y: "..tostring(marble.y))

		 object=self.x+self.width
	else
	
		 object=self.x-self.width
	end-- add collision here
end

function HorzWall:draw()
    love.graphics.rectangle("fill",self.x, self.y,self.width,self.height,self.radius)
end