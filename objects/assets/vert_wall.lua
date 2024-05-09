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
	-- add collision here	collidedWallX=CheckCollisionX(marble.x,marble.width,wallX,wallWidth)

	if collidedWallY then 
		-- print ("wall: Y: "..tostring(marble.x).." | Y: "..tostring(marble.y))


		--right/top side
		marble.y=wallY+wallHeight
		-- marble.x=wallX+wallWidth

		--left/botton side
		marble.y=wallY-wallHeight
		-- marble.x=wallX-wallWidth
	end

	if collidedWallX then 
		-- print ("wall: X: "..tostring(marble.x).." | Y: "..tostring(marble.y))

		 marble.x=wallX+wallWidth

	
		 marble.x=wallX-wallWidth
	end
end

function VertWall:draw()
    love.graphics.rectangle("fill",self.x, self.y,self.width,self.height,self.radius)
end