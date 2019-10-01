-- Cannon ball
-- There are two types of canonn balls: normal and bomb

local physics = require('physics')

local _M = {}


function _M.newBall(sx,sy,potereAttivato)
	
	if potereAttivato then
		local txt = display.newText( "Potere speciale attivo", display.contentWidth/2 +50 ,  30, native.systemFont,12 )
		 transition.to( txt, { time=1500, alpha=0} )
	 ball = display.newImageRect("images/RainbowBall.png", 15, 15)
	ball.x  = display.contentWidth/2
	ball.y = 0
	physics.addBody(ball, 'static' , {radius=7.5,bounce=0.8})
	ball.density= 0.73
	-- While the ball rests near the cannon, it's static
	ball.isLaunched = false else 
	 ball = display.newImageRect("images/blackball.png", 15, 15)
	ball.x  = display.contentWidth/2
	ball.y = 0
	physics.addBody(ball, 'static' , {radius=7.5,bounce=0.8})
	ball.density= 0.73
	-- While the ball rests near the cannon, it's static
	ball.isLaunched = false end


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
