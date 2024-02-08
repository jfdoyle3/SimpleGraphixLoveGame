--[[
	NPC Ojbect
]]
Npc=Object:extend()

function Npc:new()
	self.name=name or "Nemesis"
	self.life = 10
	self.attack = 10
	self.defend = 10
	self.str = 10
	self.dex = 10
	self.state=false
	self.x=350
	self.y=20
	self.speed=500
end