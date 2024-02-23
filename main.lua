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
	require "objects.button"
	require "objects.player"
	require "objects.npc"
	
	player=Player()
	npc=Npc()

-- Playing Field - Adnroid Pixel 4a
	playingFieldXOffset = 5
	playingFieldYOffset = 30
	playingFieldXSize = 100
	playingFieldYSize = 100





	math.randomseed(os.time())
	npcAction = math.random(10)

	round = 0

	npcMiss = 0
	npcScore = 0
	playerScore = 0
	playerMiss = 0


--[[
	  Use last action and round for a key value
	of game rounds logs for actionlog
	]]


	lastAction = {
		"Score","Miss"
	}
	acionLog = {}



--[[
	      Objects
	]]


-- Buttons
-- Joystick
	buttonUp = Button.new("UP",100,230,50,50,false)
	buttonDown = Button.new("Down",100,330,50,50,false)
	buttonLeft = Button.new("Left",50,280,50,50,false)
	buttonRight = Button.new("Right",150,280,50,50,false)
--
	buttonAttack = Button.new("Attack",300,280,100,50,false)
	buttonDefend = Button.new("Defend",500,280,100,50,false)

end

--  This is where things move
function love.update(dt)
	player:update(dt)
	-- npc:Update(dt)


end

--[[
	Draw
]]
function love.draw()

	--[[ This should turn the circle/npc black and white to appear blink when pushing the button
	if not (buttonAttack.state) then
		love.graphics.setColor(255,255,255)
		love.graphics.circle("fill",npcCharGraphic.posX,npcCharGraphic.posY,npcCharGraphic.sizeX)
	elseif buttonAttack.state then
		love.graphics.setColor(0,0,0)
		love.graphics.circle("fill",npcCharGraphic.posX,npcCharGraphic.posY,npcCharGraphic.sizeX)
		
	end
	]]
-- Playing Field - Android Pixel 4a
	love.graphics.rectangle("line",playingFieldXOffset,playingFieldYOffset,playingFieldXSize,playingFieldYSize)
-- Button Layer
--	print("attack: "..tostring(buttonAttack.state))
--	print("defend: "..tostring(buttonDefend.state))
-- Joystick Diplay
--[[	love.graphics.setColor(250,255,200)
	love.graphics.rectangle("fill",buttonUp.posX,buttonUp.posY,buttonUp.sizeX,buttonUp.sizeY)
	love.graphics.rectangle("fill",buttonDown.posX,buttonDown.posY,buttonDown.sizeX,buttonDown.sizeY)
	love.graphics.rectangle("fill",buttonLeft.posX,buttonLeft.posY,buttonLeft.sizeX,buttonLeft.sizeY)
	love.graphics.rectangle("fill",buttonRight.posX,buttonRight.posY,buttonRight.sizeX,buttonRight.sizeY)

--]]
-- Button 1 / Button 2
--[[
	love.graphics.rectangle("fill",buttonAttack.posX,buttonAttack.posY,buttonAttack.sizeX,buttonAttack.sizeY)
	love.graphics.rectangle("fill",buttonDefend.posX,buttonDefend.posY,buttonDefend.sizeX,buttonDefend.sizeY)
	]]
-- love.graphics.setColor(255,255,255)

-- Player on Playing Field
--	love.graphics.rectangle("fill",playerCharGraphic.posX+playingFieldXOffset,playerCharGraphic.posY+playingFieldYOffset,playerCharGraphic.sizeX,playerCharGraphic.sizeY)
player:draw()
--[[ Defend Button
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",buttonRight.posX,buttonRight.posY,buttonRight.sizeX,buttonRight.sizeY)
	love.graphics.setColor(255,255,255)
	]]

	love.graphics.setColor(255,255,255)
	love.graphics.circle("fill",50,5,npcCharGraphic.sizeX)
	love.graphics.setColor(0,0,0)
	love.graphics.circle("fill",50,5,npcCharGraphic.sizeX)



end