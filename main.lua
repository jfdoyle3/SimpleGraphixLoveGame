--[[
      Simple Graphix Love Game
		Main Game Loop
	The game will continuously
	run these three functions until the
	game ends.
	run order:
		Load / Update / Draw
]]

-- local joystick  -- Location may be in object
local marble

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
	Object=require "library.classic"
	require "objects.marble"
	
	
	-- Marble: Input:  keyboard or joystick, Name: Hero, default: Marble
	name="Hero"
	inputOption="keyboard"
	
	marble=Marble(inputOption,name)

-- Playing Field - Adnroid Pixel 4a
-- These offsets is where 0,0. Just under the status bar.
	playingFieldXOffset = 5
	playingFieldYOffset = 30


	math.randomseed(os.time())
	randNum = math.random(10)
	
	joystick = love.joystick.getJoysticks()[1] -- note, that you may like to get all joystick and select the best one, this just gets the first one


end



--  This is where things move
function love.update(dt)
--[[
	This is probably be ended up in the object.
	local x, y, z = joystick:getAxes() -- now you can get orientation of phone and process it
	
	
	Updates the objects: sprite, movement, other actions: refer to object.
]]
	 marble:update(dt)


end

--[[
	Draw
]]
function love.draw()
	
	marble:draw()


end
