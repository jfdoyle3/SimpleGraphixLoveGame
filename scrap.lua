---[[

	Scrap paper.

]]

-- Playing Field - Adnroid Pixel 4a
playingFieldXOffset=5
playingFieldYOffset=30
playingFieldXSize=825
playingFieldYSize=200

playingfield={}
for row=playingFieldXOffset, playingFieldXSize do
	playingfield[row]={}
	for col=playingFieldYOffset, playingFieldYSize do
		playingfield[row][col]=0
	end
end