--[[
      Simple Graphix Love Game
		Main Game Loop
	The game will continuously
	run these three functions until the
	game ends.
	run order:
		Load / Update / Draw
]]

require("objects.button")
require("objects.player")
require("objects.npc")

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

--


-- Player
-- player = Player.new()
	playerCharGraphic = {}
	playerCharGraphic.posX = 0+playingFieldXOffset
	playerCharGraphic.posY = 0+playingFieldYOffset
	playerCharGraphic.sizeX = 10
	playerCharGraphic.sizeY = 10
	playerCharGraphic.speed = 100

-- NPC
--	npc = Npc.new()
	npcCharGraphic = {}
	npcCharGraphic.posX = 80+playingFieldXOffset
	npcCharGraphic.posY = 80+playingFieldYOffset
	npcCharGraphic.sizeX = 5
	npcCharGraphic.sizeY = 5



	collisionBox = {}
	collisionBox.posX = 80+playingFieldXOffset
	collisionBox.posY = 80+playingFieldYOffset
	collisionBox.sizeX = 5
	collisionBox.sizeY = 5
	collisionBox.playerMid=5
	collisionBox.collided=false


--[[	Object test console output
	print(buttonUp.title,buttonUp.posX,buttonUp.posY,buttonUp.sizeX,buttonUp.sizeY,buttonUp.state)
	print(buttonDown.title)
	print(player.name,player.life,player.attack,player.defend,player.str,player.dex,player.state)
	print(npc.name,npc.life,npc.attack,npc.defend,npc.str,npc.dex,npc.friend)
]]



end
--[[
           Mouse Press / Screen Tap
	]]
function love.mousepressed(x, y)
	if x > buttonUp.posX and x < buttonUp.posX+buttonUp.sizeX and
	y > buttonUp.posY and y < buttonUp.posY+buttonUp.sizeY then
		buttonUp.state = true

	elseif x > buttonDown.posX and x < buttonDown.posX+buttonDown.sizeX and
	y > buttonDown.posY and y < buttonDown.posY+buttonDown.sizeY then
		buttonDown.state = true

	elseif x > buttonLeft.posX and x < buttonLeft.posX+buttonLeft.sizeX and
	y > buttonLeft.posY and y < buttonLeft.posY+buttonLeft.sizeY then
		buttonLeft.state = true

	elseif x > buttonRight.posX and x < buttonRight.posX+buttonRight.sizeX and
	y > buttonRight.posY and y < buttonRight.posY+buttonRight.sizeY then
		buttonRight.state = true
	end
	
	if playerCharGraphic.posX>collisionBox.posX and playerCharGraphic.posY<collisionBox.posY then
		collisionBox.collided=true
	end

end


--  This is where things move
function love.update(dt)
	if buttonUp.state then
		playerCharGraphic.posY = playerCharGraphic.posY-playerCharGraphic.speed*dt
		buttonUp.state = false

	elseif buttonDown.state then
		playerCharGraphic.posY = playerCharGraphic.posY+playerCharGraphic.speed*dt
		buttonDown.state = false

	elseif buttonLeft.state then
		playerCharGraphic.posX = playerCharGraphic.posX-playerCharGraphic.speed*dt
		buttonLeft.state = false

	elseif buttonRight.state then
		playerCharGraphic.posX = playerCharGraphic.posX+playerCharGraphic.speed*dt
		buttonRight.state = false

	end
-- buttonUp.posX=buttonUp.posX+10*dt

end
--	print("up: "..collisionBox.collided)
--[[
	Draw
]]
function love.draw()

	love.graphics.print("pX: "..playerCharGraphic.posX,200,50)
	love.graphics.print("pY: "..playerCharGraphic.posY,200,65)
	love.graphics.print("npc: "..npcCharGraphic.posX..","..npcCharGraphic.posY,200,100)
	if collisionBox.collided then
		print("draw: "..collisionBox.collided)
		love.graphics.print("Hit!!!",250, 100)
    end
	if !collisionBox then
		love.graphics.setColor(255,255,255)
		love.graphics.circle("fill",npcCharGraphic.posX,npcCharGraphic.posY,npcCharGraphic.sizeX)
	elseif collisionBox then
		love.graphics.setColor(0,0,0)
		love.graphics.circle("fill",npcCharGraphic.posX,npcCharGraphic.posY,npcCharGraphic.sizeX)
	end
-- Playing Field - Android Pixel 4a
	love.graphics.rectangle("line",playingFieldXOffset,playingFieldYOffset,playingFieldXSize,playingFieldYSize)
-- Button Layer

-- Joystick Diplay
	love.graphics.setColor(250,255,200)
	love.graphics.rectangle("fill",buttonUp.posX,buttonUp.posY,buttonUp.sizeX,buttonUp.sizeY)
	love.graphics.rectangle("fill",buttonDown.posX,buttonDown.posY,buttonDown.sizeX,buttonDown.sizeY)
	love.graphics.rectangle("fill",buttonLeft.posX,buttonLeft.posY,buttonLeft.sizeX,buttonLeft.sizeY)
	love.graphics.rectangle("fill",buttonRight.posX,buttonRight.posY,buttonRight.sizeX,buttonRight.sizeY)

--
-- Button 1 / Button 2
	love.graphics.rectangle("fill",buttonAttack.posX,buttonAttack.posY,buttonAttack.sizeX,buttonAttack.sizeY)
	love.graphics.rectangle("fill",buttonDefend.posX,buttonDefend.posY,buttonDefend.sizeX,buttonDefend.sizeY)
-- love.graphics.setColor(255,255,255)

-- Player on Playing Field
	love.graphics.rectangle("fill",playerCharGraphic.posX+playingFieldXOffset,playerCharGraphic.posY+playingFieldYOffset,playerCharGraphic.sizeX,playerCharGraphic.sizeY)
--[[ Defend Button
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",buttonRight.posX,buttonRight.posY,buttonRight.sizeX,buttonRight.sizeY)
	love.graphics.setColor(255,255,255)
]]
end