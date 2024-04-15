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
	require "objects.marble"
	require "objects.enemy"
	require "library.collision"

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
	wallHeight=40
	wallWidth=15
	wallRadius=3

	math.randomseed(os.time())
	randNum = math.random(10)
	enemyRandLocationX=math.random(100)
	enemyRandLocationY=math.random(100)

	inputSelection={"keyboard","joystick","phone"}
	
	
	-- Marble: Input:  keyboard/joystick/phone, Name: Hero, default: Marble
	name="Hero"
	inputOption=inputSelection[1]
	marble=Marble(inputOption,joystick,name)
	enemy=Enemy(enemyRandLocationX,enemyRandLocationY)

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
	collidedEnemy=CheckCollision(marble.x,marble.y,marble.width,marble.height,enemy.x,enemy.y,enemy.width,enemy.height)
	collidedWall=CheckCollision(marble.x,marble.y,marble.width,marble.height,wallX,wallY,wallWidth,wallHeight)

	if collidedEnemy then 
	score=CheckCollisionAndScore(marble.x,marble.y,marble.width,marble.height,enemy.x,enemy.y,enemy.width,enemy.height,score)	
	end
	
	if collidedWall then 
		print ("wall: X: "..tostring(marble.x).." | Y: "..tostring(marble.y))
		
		--[[ collision dectection works with one of the lines
		currently works, but need a: 
		marble.y=wallY-wallHeight
		marble.x=wallX-wallWidth
		too ..
		]]
		marble.y=wallY+wallHeight
		marble.x=wallX+wallWidth
		marble.y=wallY-wallHeight
		marble.x=wallX-wallWidth
	end
	
end

--[[
	Draw
]]
	function love.draw()
		love.graphics.rectangle("fill",wallX,wallY,wallWidth,wallHeight,wallRadius)
		marble:draw()

		if not collidedEnemy then
			enemyImage=enemy:draw()
		elseif collidedEnemy then 
			-- removes/blanks enemy from screen
			enemyImage=nil
			love.graphics.print(score,10,10)
		end
	end