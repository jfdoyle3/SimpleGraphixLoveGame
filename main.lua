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

	buttonA=Button.new("UP",200,300,100,100,false)
	buttonD=Button.new("Down",475,300,200,100,false)
	buttonLeft=Button.new("Left",200,300,200,100,false)
	buttonRight=Button.new("Right",475,300,200,100,false)
	


-- Player
	player=Player.new()

-- NPC
	npc=Npc.new()

--[[	Object test console output
	
	print(buttonA.title,buttonA.posX,buttonA.posY,buttonA.sizeX,buttonA.sizeY,buttonA.state)
	print(buttonD.title)
	print(player.name,player.life,player.attack,player.defend,player.str,player.dex)
	print(npc.name,npc.life,npc.attack,npc.defend,npc.str,npc.dex,npc.friend)
]]



end
--[[
           Mouse Press / Screen Tap
	]]
function love.mousepressed(x, y)
	if x > buttonA.posX and x < buttonA.posX+buttonA.sizeX and 
       y > buttonA.posY and y < buttonA.posY+buttonA.sizeY then
		buttonA.state = true
		round=round+1
	elseif x > buttonD.posX and x < buttonD.posX+buttonD.sizeX and 
           y > buttonD.posY and y < buttonD.posY+buttonD.sizeY then
		buttonD.state = true
		round=round+1
	end

end

function love.update(dt)
	if buttonA.state and npcAction%2 == 1 then
	    npcMiss=npcMiss+1 -- Player Attack -> NPC Defend
		buttonA.state = false
		npcAction = math.random(10)
	elseif buttonD.state and npcAction%2 == 0 then
		npcScore = npcScore + 1 -- Player Defend -> NPC Attack
		buttonD.state = false
		npcAction = math.random(10)
	end
	
	if buttonA.state and npcAction%2 == 0 then
		playerScore = playerScore+1 -- Player Attack -> NPC Attack       
		buttonA.state = false
		npcAction = math.random(10)
	elseif buttonD.state and npcAction%2 == 1 then
		playerMiss=playerMiss+1  -- Player Defend -> NPC Defend
		buttonD.state = false
		npcAction = math.random(10)
	end
	-- buttonA.posX=buttonA.posX+10*dt
	
end

--[[
	Draw
]]
function love.draw()
-- Button Layer
	love.graphics.rectangle("line",0,0,800,300)
-- Attack Button
	love.graphics.setColor(0,255,0)
	love.graphics.rectangle("fill",buttonA.posX,buttonA.posY,buttonA.sizeX,buttonA.sizeY)
	love.graphics.setColor(255,255,255)

--[[ Defend Button
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill",buttonRight.posX,buttonRight.posY,buttonRight.sizeX,buttonRight.sizeY)
	love.graphics.setColor(255,255,255)
]]
end


