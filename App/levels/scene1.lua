---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
--sceglieri qui partita storia o no
require ("lib.partitaStoria")
local scene = composer.newScene()
require("lib.LD_LoaderX")
physics = require ("physics")
physics.start()
local _W = display.contentWidth
local _H = display.contentHeight
local damage = 15
local bg = display.newRect( _W/2, _H/2, _W, _H )
bg.alpha=0.01
local nMattoni = 0 --numero dei mattoni
local muroSinistra = display.newRect( 0, _H/2, 0 ,_H )
local muroDestra = display.newRect( _W, _H/2, 0 , _H)
local muroInBasso = display.newRect( _W/2, _H+15, _W, 0 )
local muroInAlto = display.newRect( _W/2, -5, _W, 0 )
local canShoot = true
 physics.addBody( muroSinistra,"static")
 physics.addBody( muroDestra,"static")
 physics.addBody( muroInBasso,"static")
 physics.addBody( muroInAlto,"static")
 muroInBasso:addEventListener( "collision", function(event)  event.other:removeSelf( ) event.other = nil canShoot = true end )
 local rect = display.newRect( _W/2, 0, 10, 50 )
 rect:setFillColor( 0.5,0.5,0.6 )
 rect.anchorY = 0
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local btn = nil
local myLevel = {}
--local p = 10
function getLevel()
	return myLevel
end
--local rect = display.newRect( 0, _H -100 , 200, 50 )
--local rect2 = display.newRect( _W, _H -100, 200, 50 )
--rect2:addEventListener( "tap", function() p= p+10 print(p) end )
--rect:addEventListener( "tap", function() p= p-10 print(p) end )
---------------------------------------------------------------------------------
-- FUNZIONE DI SHOOTING
---------------------------------------------------------------------------------
function shoot(event) --i=10 bounce = 0,6 local angle = math.atan2(my - (cerchio.y + event.y/5.5), mx - (cerchio.x +0))

	  function getAngle() --FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
    local angolo
    local latoVerticale = event.y
    print("il lato verticale e':" .. latoVerticale)
    print("rect.y=" .. rect.y)
    local latoObliquo = math.sqrt(math.pow((rect.x - event.x),2)+math.pow((rect.y - event.y),2))
    print("il lato obliquo e':" .. latoObliquo)
    angoloRad = (math.acos(latoVerticale/latoObliquo))  --radianti
    print("angolo radianti = ".. angoloRad)
    angolo= ((angoloRad*180)/3.14)
    print("angolo = ".. angolo)
    if (event.x < _W/2) then
    return angolo
    else return -angolo end
  end --FINE FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
  rect.rotation = getAngle()
	if canShoot then
		--canShoot = false
	print(event.phase)
	i=5.5
    cerchio = display.newCircle(_W/2, 0, i) --creazione palla
    physics.addBody(cerchio,{radius=i,bounce=0.8})
deltaX =  event.x-_W/2
deltaY = event.y
normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
 speed = 700
 print(normDeltaX.." * "..string.format(speed).."= "..string.format(normDeltaX*speed))
  print(normDeltaY .. " * " .. string.format(speed).."= " .. string.format(normDeltaY*speed))
  physics.setGravity(0, 0)
cerchio:setLinearVelocity( normDeltaX  * speed, normDeltaY  * speed )
    end end
 bg:addEventListener("tap",shoot)
---------------------------------------------------------------------------------
-- CREAZIONE PALLA ANIMATA
---------------------------------------------------------------------------------
function creaSfera()
	   local cerchioProps =
	{
		name 	= "ball",
		x		= 50,
		y		= 40,
		assetName	= "balls_preview2_0",
		xScale = 0.1,
		yScale = 0.1,
	}

	local cerchio = getLevel():createObject("Layer 1", cerchioProps ).view
	cerchio:setSequence("ball_splash")
   cerchio:play()
    end
---------------------------------------------------------------------------------
--FUNZIONE DI RIMOZIONE BLOCCHI
---------------------------------------------------------------------------------
function removeBrick(brick)
	brick:removeSelf()
	brick = nil
	nMattoni = nMattoni - 1
	if nMattoni == 0 then
		local txt = display.newText( "Hai vinto!", _W/2, _H/2 , native.systemFont,12 )
end end
---------------------------------------------------------------------------------
--FUNZIONE QUANDO AVVIENE COLLISIONE TRA BLOCCHI E PALLA
---------------------------------------------------------------------------------
function hit(event)
	physics.setGravity( 0, 46 )
	        brick = event.target
            local vx, vy = event.other:getLinearVelocity()
            --calcolo del modulo di vx e vy
            if vx<0 then vx = -vx end
            if vy<0 then vy = -vy end
          --  if vx == 0 and brick.c==2 then
           -- 	if brick.x > _W/2 then
           -- 		brick.applyForce(-10,5,brick.x,brick.y)
           -- 	else
          --  		brick.applyForce(10,5,brick.x,brick.y)
          --  	elseif vx==0 and brick.c<2 then
          --  		c= c+1
          --  	end end
			brick.life = brick.life - (damage + vy/10 +vx/10)
			--print("ciao")

			if brick.life < 0 then
               removeBrick(brick)
				else
					brick.alpha = brick.life/100.00
				end
				if brick.alpha<0.25 then --per rendere più visibili mattoni che avrebbero un alpha troppo basso
					brick.alpha = 0.25
				end
			end
---------------------------------------------------------------------------------
--FUNZIONE DI PROVA
---------------------------------------------------------------------------------
--[[local pg = display.newImageRect( "images/Owlet_Monster.png",64,64)
pg.x = 120 pg.y = 0
--pg.fill.effect = "filter.blurVertical"
--pg.fill.effect.blurSize = 8
--pg.fill.effect.sigma = 128
--blurSize — default = 8 ; min = 2 ; max = 512
--sigma — default = 128 ; min = 2 ; max = 512
function moveMonster(event)
	pg.y = pg.y + 5
	if (pg.y > _H) then
		pg.y=-32
	end
end
Runtime:addEventListener( "enterFrame", moveMonster )
--]]

-- Called when the scene's view does not exist:
function scene:create( event )
  partitaS:prova()
  print(partitaS:provaVar())
	local screenGroup = self.view
	--local myLevel = {}
	myLevel = LD_Loader:new(self.view)
	myLevel:loadLevel("Level01") -- set your scene/level name here
    --physics.setDrawMode( "debug" )
    creaSfera()
    -- aggiunta listener ai mattoni
	local obj = {}
	for i=1,29 do
	obj[i] = {}
	obj[i] = myLevel:getLayerObject("Layer 1","Brick_"..string.format(i)).view
	 obj[i]:addEventListener( "preCollision", hit)
	obj[i].life = 100.00
	obj[i].c = 0 --conta quante volte in una singola sessione di tiro è stato colpito verticalmente
	nMattoni = nMattoni + 1
	end

	-- Touch event listener for button
	function onButtonClick( event )
		print ("touch")
		if event.phase == "began" then

			composer.gotoScene( "scene2", "zoomOutInFade", 300  )

			return true
		end
	end

	-- btn = myLevel:getLayerObject( "layer1","btnNext" )
	-- btn.onPress = onButtonClick

	print( "\n1: create event")
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
    if nil~= composer.getScene("toPlay") then composer.removeScene("page_1", false) end
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
		local prevScene = composer.getSceneName( "previous" )
		-- remove previous scene's view
		if (prevScene) then
			composer.removeScene( prevScene )
		end
    end

	print( "1: show event - ", phase )


end


-- Called when scene is about to move offscreen:
function scene:hide( event )

	print( "1: hide event" )

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	myLevel:removeLevel()
	myLevel = nil
	print( "((destroying scene 1's view))" )
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
---------------------------------------------------------------------------------

return scene
