local _M = {}
local newBall = require('lib.ball').newBall
require("lib.LD_LoaderX")
local myLevel = {}
local gruppo_cannone = display.newGroup()
myLevel= LD_Loader:new()
myLevel:loadLevel("shoot")
display.setDefault( "isAnchorClamped", false )
function _M.newCannon()
    --local cannon = display.newImageRect("images/cannon.png", 25, 50)
    cannon = myLevel:getLayerObject("LayerCannone", "cannon_fire_0").view
  --  segnalino = display.newCircle( gruppo_cannone, display.contentWidth/2, 130, 1 )
    cannone_x= cannon.x
    cannone_y= cannon.y
    --segnalino:setFillColor(1,1,1)
    --segnalino.alpha = 1
	gruppo_cannone:insert(cannon)
  --gruppo_cannone:insert(segnalino)
    cannon.x = display.contentWidth/2
    cannon.y = 60  --50
    cannon.anchorY = 0.35

  --  myLevel:getLayerObject("Layer 1","Brick_"..string.format(i))
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
 --local bounds = cannon.contentBounds
 --print( "xMin: ".. bounds.xMin ) -- xMin: 75
--print( "yMin: ".. bounds.yMin ) -- yMin: 75
--print( "xMax: ".. bounds.xMax ) -- xMax: 125
--print( "yMax: ".. bounds.yMax ) -- yMax: 125


  	local ball = newBall(sx,sy,potereAttivato, cannon.rotation)
	if ball and not ball.isLaunched then
    cannon:play()
		ball:launch()
    end
 end
     return cannon
 end

return _M
