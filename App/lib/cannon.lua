local _M = {}
local newBall = require('lib.ball').newBall
function _M.newCannon()
    local cannon = display.newImageRect("images/cannon.png", 25, 50)
	cannon.x = display.contentWidth/2
	cannon.y = 0
	cannon.anchorY = 0
---------------------------------------------------------------------------------
-- FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
---------------------------------------------------------------------------------
	function cannon:getAngle(sx,sy) --FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
         local angolo
         local latoVerticale = sy
         local latoObliquo = math.sqrt(math.pow((display.contentWidth/2 - sx),2)+math.pow(( - sy),2))
         angoloRad = (math.acos(latoVerticale/latoObliquo))  --radianti
         angolo= ((angoloRad*180)/3.14)
         if (sx < display.contentWidth/2) then
         cannon.rotation = angolo
         else cannon.rotation = -angolo end
       end --FINE FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
---------------------------------------------------------------------------------
-- FUNZIONE DI SHOOTING
---------------------------------------------------------------------------------
  function cannon:shoot(event,potereAttivato)
    print("cannon:shoot",potereAttivato)
    sx,sy= event.x , event.y
 cannon:getAngle(sx,sy)
  	local ball = newBall(sx,sy,potereAttivato)
	if ball and not ball.isLaunched then
		ball:launch()
    end
 end
     return cannon
 end

return _M
