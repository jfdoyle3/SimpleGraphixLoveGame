--[[
      Simple Graphix Love Game
		Main Game Loop
	The game will continuously
	run these three functions until the
	game ends.
	run order:
		Load / Update / Draw
]]


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
	
	marble=Marble()

-- Playing Field - Adnroid Pixel 4a
-- These offsets is where 0,0. Just under the status bar.
	playingFieldXOffset = 5
	playingFieldYOffset = 30






	math.randomseed(os.time())
	npcAction = math.random(10)


end

--  This is where things move
function love.update(dt)

	-- marble:update(dt)


end

--[[
	Draw
]]
function love.draw()

	marble:draw()


end