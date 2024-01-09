--[[

	Sandbox for testing code.

]]

function randomPostions()
	
	tokensPosX = math.random(3)
	tokensPosY = math.random(3)
return tokensPosX,tokensPosY
end

function drawBoard()
 for j=1,3,1
		do
			print(table.concat(board[j],","))
		end

end


print ("Starting:")
math.randomseed(os.time())
tokens={0,1,2,3,9}
-- Static: board={{1,0,0},{0,2,0},{3,0,9}}
board={}
for row=1, 3,1
do
	board[row]={}
	for col=1,3,1
	do
		board[row][col]=0
	end
end

drawBoard()


-- Tokens
grass=tokens[1]
player=tokens[2]
tree=tokens[3]
npc=tokens[4]
treasure=tokens[5]

--[[
	place tokens on board
	
	place player
]]
playerX,playerY=randomPostions()
board[playerX][playerX]=player
treeX,treeY=randomPostions()
board[treeX][treeX]=tree

print("p: "..playerX..","..playerY)
print("t: "..treeX..","..treeY)
print("Updated:")
drawBoard()

-- find tokens on board.
for i=1,3,1
do
	for j=1,3,1
	do
		if board[i][j]==1 then
			print("found: "..i .. ","..j)
		end
			if board[i][j]==2 then
			print("found: "..i .. ","..j)
		end
	end
end




print("end of line")








