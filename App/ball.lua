-- Cannon ball
-- There are two types of canonn balls: normal and bomb

local physics = require('physics')

local _M = {}


function _M.newBall(sx,sy)
	local ball = display.newImageRect("images/blackball.png", 11, 11)
	ball.x  = display.contentWidth/2
	ball.y = 0
	physics.addBody(ball, 'static' , {radius=5.5,bounce=0.8})
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
