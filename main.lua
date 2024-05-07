--[[
      Simple Graphix Love Game
		Main Game Loop
	The game will continuously
	run these three functions until the
	game ends.
	run order:
		Load / Update / Draw
]]


local marble,enemy

function love.load()
	playingGrid={1,100,9}

	-- create a loop to display grid in a grid like fashion
--[[
		Android/iOS text input is disabled by default.
		On iOS and Android this variant tells the OS that the
		specified rectangle is where text will show up in the game,
		which prevents the system on-screen keyboard from covering the text.
		love.keyboard.setTextInput( enable, x, y, w, h )
		just enabling it may be fine.
	]]
--love.keyboard.setTextInput(enable)
	Object=require "dependencies.classic"
	require "library.collision"
	require "objects.players.marble"
	require "objects.players.enemy"
	require "objects.assets.horz_wall"
	require "objects.assets.vert_wall"
	

	

	score=0

	--[[
	    Trying to initialize joystick once 
		and pass through joystick where is needed.
	joysticks = love.joystick.getJoysticks()
	
	if not joystick then 
		inputOption="keyboard"
	end
	
    joystick = joysticks[1]
	]]

	-- Playing Field - Adnroid Pixel 4a
-- These offsets is where 0,0. Just under the status bar.
	playingFieldXOffset = 5
	playingFieldYOffset = 30

	wallX=90
	wallY=90
	wallVX=190
	wallVY=90
	wallWidth=playingGrid[2]
	wallHeight=100
--[[	
	wallHeight=40
	wallWidth=15
	wallRadius=3
	
]]
	math.randomseed(os.time())
	randNum = math.random(10)
	enemyRandLocationX=math.random(100)
	enemyRandLocationY=math.random(100)

	inputSelection={"keyboard","joystick","phone"}


	-- Marble: Input:  keyboard/joystick/phone, Name: Hero, default: Marble
	name="Hero"
	inputOption=inputSelection[1]
	
--  Instantiate Objects: 	
	marble=Marble(inputOption,joystick,name)
	enemy=Enemy(enemyRandLocationX,enemyRandLocationY)
	hWall=HorzWall(wallX,wallY,wallWidth)
	vWall=VertWall(wallVX,wallVY,wallHeight)
	

end



--  This is where things move
function love.update(dt)
--[[
	This is probably be ended up in the object.
	local x, y, z = joystick:getAxes() -- now you can get orientation of phone and process it
	
	
	Updates the objects: sprite, movement, other actions: refer to object.
]]
	marble:update(dt)

--[[
		collision detection here?
	   marble.x, marble.y  |  enemy.x, enemy.y 
		these give back x,y pos.
]]
--[[
	collidedEnemy=CheckCollision(marble.x,marble.y,marble.width,marble.height,enemy.x,enemy.y,enemy.width,enemy.height)
	collidedWallX=CheckCollisionX(marble.x,marble.width,wallX,wallWidth)
	collidedWallY=CheckCollisionY(marble.y,marble.height,wallY,wallHeight)

	if collidedEnemy then 
		score=CheckCollisionAndScore(marble.x,marble.y,marble.width,marble.height,enemy.x,enemy.y,enemy.width,enemy.height,score)	
	end

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
]]
end

--[[
	Draw
]]
function love.draw()
	
	hWall:draw()
	vWall:draw()
	-- love.graphics.rectangle("fill",wallX,wallY,wallWidth,wallHeight,wallRadius)
--	marble:draw()
--[[
	if not collidedEnemy then
		enemyImage=enemy:draw()
	elseif collidedEnemy then 
		score=score+1
		enemyImage=nil
		love.graphics.print(score,10,10)
	end
	]]
end