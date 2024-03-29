-- Collision detection functions


function CheckCollision(objectAX,objectAY,objectAWidth,objectAHeight, objectBX,objectBY,objectBWidth,objectBHeight)
	return objectAX < objectBX+objectBWidth and
	objectBX < objectAX+objectAWidth and
	objectAY < objectBY+objectBHeight and
	objectBY < objectAY+objectAHeight
end