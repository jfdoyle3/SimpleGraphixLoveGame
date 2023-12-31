--[[

	This example code from Love site on
	scaling the screen for different devices/platform

]]





function love.load ()
	-- if your code was optimized for fullHD:
	window = {translateX = 40, translateY = 40, scale = 2, width = 1920, height = 1080}
	width, height = love.graphics.getDimensions ()
	love.window.setMode (width, height, {resizable=true, borderless=false})
	resize (width, height) -- update new translation and scale
end

function love.update (dt)
	-- mouse position with applied translate and scale:
	local mx = math.floor ((love.mouse.getX()-window.translateX)/window.scale+0.5)
	local my = math.floor ((love.mouse.getY()-window.translateY)/window.scale+0.5)
	-- your code here, use mx and my as mouse X and Y positions
end

function love.draw ()
	-- first translate, then scale
	love.graphics.translate (window.translateX, window.translateY)
	love.graphics.scale (window.scale)
	-- your graphics code here, optimized for fullHD
	love.graphics.rectangle('line', 0, 0, 1920, 1080)
end

function resize (w, h) -- update new translation and scale:
	local w1, h1 = window.width, window.height -- target rendering resolution
	local scale = math.min (w/w1, h/h1)
	window.translateX, window.translateY, window.scale = (w-w1*scale)/2, (h-h1*scale)/2, scale
end

function love.resize (w, h)
	resize (w, h) -- update new translation and scale
end