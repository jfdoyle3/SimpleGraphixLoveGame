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


	math.randomseed(os.time())
	randNum = math.random(10)

	inputSelection={"keyboard","joystick","phone"}

	-- Marble: Input:  keyboard/joystick/phone, Name: Hero, default: Marble
	name="Hero"
	inputOption=inputSelection[1]
--[[
	joystick = love.joystick.getJoysticks()[controller] -- note, that you may like to get all joystick and select the best one, this just gets the first one
	if not joystick then return end   -- could be used then default input is keyboard
	----
	if not joystick then
		inputOption=inputSelection[1]
	end
	----
	if inputOption=="joystick" then
		controller=1
	end
	
	if inputOption=="phone" then
		controller=2
	end
	

	]]
	marble=Marble(inputOption,joystick,name)
	enemy=Enemy()


	

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

end
--[[
	Draw
]]
function love.draw()

	marble:draw()
	enemy:draw()

end

-- Collision detection
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	return player_x1 < enemy_x2+enemy_width2 and
	enemey_x2 < player_x1+enemy_width1 and
	player_y1 < enemy_y2+enemy_height2 and
	enmey_y2 < player_y1+player_height1
end