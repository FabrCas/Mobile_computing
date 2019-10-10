-- Cannon ball
-- There are two types of canonn balls: normal and bomb

local physics = require('physics')
require ("lib.partitaStoria")
local _M = {}


function _M.newBall(sx,sy,potereAttivato, angolo)

	if potereAttivato then
	 ball = display.newImageRect("images/PallaSpeciale"..partitaS:personaggio()..".png", 15, 15)
	else
 display.setDefault( "isAnchorClamped", false )
    ball = display.newImageRect("images/default ball.png", 15, 15)
        end
    ball.x  = display.contentWidth/2
    ball.y = 50-- 130
		print("stampe")
		print(angolo)
		print(72.5/ball.contentHeight)
		ball.anchorY= -4.83 --4,83
		ball.anchorX= 0.5--72.5/ball.contentWidth
		ball.rotation=  angolo
    physics.addBody(ball, 'static' , {radius=7.5,bounce=0.8,friction=0.3})
    ball.density= 0.73
    -- While the ball rests near the cannon, it's static
    ball.isLaunched = false


	function ball:launch()
	   ball.isLaunched = true
	   ball.bodyType = 'dynamic' -- Change to dynamic so it can move
	   deltaX = sx - display.contentWidth/2
       deltaY = sy
       normDeltaX = deltaX / math.sqrt(deltaX^2 + deltaY^2)
       normDeltaY = deltaY / math.sqrt(deltaX^2 + deltaY^2)
       speed = 700
       physics.setGravity(0, 0)
       ball:setLinearVelocity( normDeltaX*speed,normDeltaY*speed )
	end
	return ball
end

return _M
