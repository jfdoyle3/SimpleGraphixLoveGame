


-- example reference: https://love2d.org/wiki/BoundingBox.lua

-- Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
-- x2,y2,w2 & h2 are the same, but for the second box.
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end


-- try this out.
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return player_x1 < enemy_x2+enemy_width2 and
         enemy_x2 < player_x1+player_width1 and
         player_y1 < enemy_y2+enemy_height2 and
         enemy_y2 < player_y1+player_height1
end