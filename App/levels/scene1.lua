---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
require("lib.LD_LoaderX")
physics = require ("physics")
physics.start()
local _W = display.contentWidth
local _H = display.contentHeight
local damage = 15
local bg = display.newRect( _W/2, _H/2, _W, _H )
bg.alpha=0.1

local muroSinistra = display.newRect( 0, _H/2, 0 ,_H )
local muroDestra = display.newRect( _W, _H/2, 0 , _H)
local muroInBasso = display.newRect( _W/2, _H+15, _W, 0 )
local muroInAlto = display.newRect( _W/2, 0, _W, 0 )
local canShoot = true
 physics.addBody( muroSinistra,"static")
 physics.addBody( muroDestra,"static")
 physics.addBody( muroInBasso,"static")
 physics.addBody( muroInAlto,"static")
 muroInBasso:addEventListener( "collision", function(event)  event.other:removeSelf( ) event.other = nil canShoot = true end )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local btn = nil
local myLevel = {}
---------------------------------------------------------------------------------
-- FUNZIONE DI SHOOTING
---------------------------------------------------------------------------------
function shoot(event)
	if canShoot then
		canShoot = false
	print(event.phase)
	i=15
    cerchio = display.newCircle(_W/2,i, i) --creazione palla
    physics.addBody(cerchio,{radius=i,bounce=0.5})
local mx,my = event.x,event.y
local angle = math.atan2(my - (cerchio.y + 0), mx - (cerchio.x +0))
local vx,vy = math.cos(angle)*10, math.sin(angle)*10
 cerchio:applyForce(vx,vy,cerchio.x,cerchio.y)
    end end
  bg:addEventListener("tap",shoot)
---------------------------------------------------------------------------------
--FUNZIONE DI RIMOZIONE BLOCCHI
---------------------------------------------------------------------------------
function removeBrick(brick)
	brick:removeSelf()
	brick = nil
end
---------------------------------------------------------------------------------
--FUNZIONE QUANDO AVVIENE COLLISIONE TRA BLOCCHI E PALLA
---------------------------------------------------------------------------------
function hit(event)
	        brick = event.target
            local vx, vy = brick:getLinearVelocity()
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

			brick.life = brick.life-(damage + vy/3 +vx/3 + math.random(2,45))
			print("ciao")

			if brick.life < 0 then
               removeBrick(brick)
				else
					brick.alpha = brick.life/100.00
				end
				if brick.alpha<0.25 then --per rendere più visibili mattoni che avrebbero un alpha troppo basso
					brick.alpha = 0.25
				end
			end

-- Called when the scene's view does not exist:
function scene:create( event )
	local screenGroup = self.view
	local myLevel = {}
	myLevel= LD_Loader:new(self.view)
	myLevel:loadLevel("Level01") -- set your scene/level name here
  --physics.setDrawMode( "debug" )

    -- aggiunta listener ai mattoni
	local obj = {}
	for i=1,29 do
	obj[i]= {}
	obj[i] = myLevel:getLayerObject("Layer 1","Brick_"..string.format(i)).view
	 obj[i]:addEventListener( "preCollision", hit)
	obj[i].life = 100.00
	obj[i].c = 0 --conta quante volte in una singola sessione di tiro è stato colpito verticalmente
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
