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


	math.randomseed(os.time())
	npcAction = math.random(10)

	round = 0
	
	npcMiss=0
	npcScore=0
	playerScore=0
	playerMiss=0
	
	
	--[[
	  Use last action and round for a key value
	of game rounds logs for actionlog  
	]]
	
	
	lastAction={"Score","Miss"}
	acionLog={}



--[[
	      Objects
	]]


-- Buttons

	buttonUp=Button.new("UP",100,200,50,50,false)
	buttonDown=Button.new("Down",100,300,50,50,false)
	buttonLeft=Button.new("Left",50,250,50,50,false)
	buttonRight=Button.new("Right",150,250,50,50,false)
	


-- Player
	player=Player.new()

-- NPC
	npc=Npc.new()

--[[	Object test console output
	
	print(buttonUp.title,buttonUp.posX,buttonUp.posY,buttonUp.sizeX,buttonUp.sizeY,buttonUp.state)
	print(buttonDown.title)
	print(player.name,player.life,player.attack,player.defend,player.str,player.dex)
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
		round=round+1
	elseif x > buttonDown.posX and x < buttonDown.posX+buttonDown.sizeX and 
           y > buttonDown.posY and y < buttonDown.posY+buttonDown.sizeY then
		buttonDown.state = true
		round=round+1
	end

end

function love.update(dt)
	if buttonUp.state and npcAction%2 == 1 then
	    npcMiss=npcMiss+1 -- Player Attack -> NPC Defend
		buttonUp.state = false
		npcAction = math.random(10)
	elseif buttonDown.state and npcAction%2 == 0 then
		npcScore = npcScore + 1 -- Player Defend -> NPC Attack
		buttonDown.state = false
		npcAction = math.random(10)
	end
	
	if buttonUp.state and npcAction%2 == 0 then
		playerScore = playerScore+1 -- Player Attack -> NPC Attack       
		buttonUp.state = false
		npcAction = math.random(10)
	elseif buttonDown.state and npcAction%2 == 1 then
		playerMiss=playerMiss+1  -- Player Defend -> NPC Defend
		buttonDown.state = false
		npcAction = math.random(10)
	end
	-- buttonUp.posX=buttonUp.posX+10*dt
	
end

--[[
	Draw
]]
function love.draw()
-- Button Layer
	love.graphics.rectangle("line",0,0,800,200)
-- Attack Button
	love.graphics.setColor(0,255,0)
	love.graphics.rectangle("fill",buttonUp.posX,buttonUp.posY,buttonUp.sizeX,buttonUp.sizeY)
	love.graphics.rectangle("fill",buttonDown.posX,buttonDown.posY,buttonDown.sizeX,buttonDown.sizeY)
	love.graphics.rectangle("fill",buttonLeft.posX,buttonLeft.posY,buttonLeft.sizeX,buttonLeft.sizeY)
	love.graphics.rectangle("fill",buttonRight.posX,buttonRight.posY,buttonRight.sizeX,buttonRight.sizeY)
	love.graphics.setColor(255,255,255)

--[[ Defend Button
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",buttonRight.posX,buttonRight.posY,buttonRight.sizeX,buttonRight.sizeY)
	love.graphics.setColor(255,255,255)
]]
end


