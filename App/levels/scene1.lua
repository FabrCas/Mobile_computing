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
partitaS:new()
local damage = partitaS:stats().danno
local bg = display.newRect( _W/2, _H/2, _W, _H )
bg.alpha=0.1 bg.name="bg"
local nMattoni = 0 --numero dei mattoni
local muroSinistra = display.newRect( 0, _H/2, 0 ,_H )
local muroDestra = display.newRect( _W, _H/2, 0 , _H)
local muroInBasso = display.newRect( _W/2, _H+15, _W, 0 )
local muroInAlto = display.newRect( _W/2, -5, _W, 0 )
local canShoot = true
local potereAttivato = false
txt_generale = display.newText( "", _W/2 +50 ,  30, native.systemFont,12 )
 physics.addBody( muroSinistra,"static")
 physics.addBody( muroDestra,"static")
 physics.addBody( muroInBasso,"static")
 physics.addBody( muroInAlto,"static")
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local btn = nil
local myLevel = {}
function getLevel()
	return myLevel
end
---------------------------------------------------------------------------------
--FUNZIONE DI RIMOZIONE BLOCCHI
---------------------------------------------------------------------------------
function removeBrick(brick)
  brick.scritta:removeSelf()
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
	if event.target.name == 'speciale' then
		 local txt = display.newText( "Potere speciale attivo per il successivo tiro", _W/2 +50 ,  30, native.systemFont,12 )
		 transition.to( txt, { time=1500, alpha=0} )
		potereAttivato = true 
		end
	physics.setGravity( 0, 46 )
	        brick = event.target
            local vx, vy = event.other:getLinearVelocity()
			brick.life = brick.life - (damage)

			if brick.life <= 0 then
               removeBrick(brick)
             else
                brick.scritta.text= brick.life
             --	brick.alpha = (brick.life/(5*100))*50
             end
           end
---------------------------------------------------------------------------------
--FUNZIONE QUANDO AVVIENE COLLISIONE TRA MURI E PALLA
---------------------------------------------------------------------------------
function hitMuro(event)
physics.setGravity( 0, 46 )
end
---------------------------------------------------------------------------------
--FUNZIONE CHE CREA LA PAUSA
---------------------------------------------------------------------------------
local function creaPausa()
local schermataPausa = display.newRect( _W/2, _H/2, 100, 100 )
    	 schermataPausa:addEventListener("tap",function(event) isPaused=false physics.start() schermataPausa:removeSelf( ) schermataPausa=nil end)
end
---------------------------------------------------------------------------------
--FUNZIONE 
---------------------------------------------------------------------------------
 local function touchPausa(event)
    	isPaused=true physics.pause() creaPausa() return true  end

 local function touchBg(event) 
    	if not isPaused then
      if event.phase == 'began' or event.phase == 'moved' then
        cannon:getAngle(event.x,event.y)
      elseif event.phase == 'ended' and canShoot then cannon:shoot(event,potereAttivato) potereAttivato=false canShoot=false  end
          end
          end 
---------------------------------------------------------------------------------
--FUNZIONE TOUCH
---------------------------------------------------------------------------------          
  local function touch(event)
  	if event.target.name == "pausa" then
  		touchPausa(event) 
  	elseif event.target.name == "bg" then
  		touchBg(event) end
  	end

local newCannon = require('lib.cannon').newCannon
cannon = newCannon()
-- Called when the scene's view does not exist:
function scene:create( event )
  partitaS:prova()
  print(partitaS:provaVar())
	local screenGroup = self.view
	--local myLevel = {}
	myLevel = LD_Loader:new(self.view) 
	myLevel:loadLevel("Level01") -- set your scene/level name here
    --physics.setDrawMode( "debug" )
    local pausa = display.newRect( _W, _H-40, 30, 10 )
    pausa.name = "pausa"
    pausa:addEventListener( "touch", touch )

    bg:addEventListener("touch", touch )

    muroInBasso:addEventListener( "collision", function(event)  event.other:removeSelf( ) event.other = nil canShoot = true end )
    muroSinistra:addEventListener( "preCollision", hitMuro)
    muroDestra:addEventListener( "preCollision", hitMuro)
    -- aggiunta listener ai mattoni
	local obj = {}
	for i=1,29 do
	obj[i] = {}
	obj[i] = myLevel:getLayerObject("Layer 1","Brick_"..string.format(i))
	obj[i].view.name= obj[i].property['tipo']
    obj[i].view.life = 5
  obj[i].view.scritta= display.newText(obj[i].view.life, obj[i].view.x, obj[i].view.y )
  obj[i].view.scritta.rotation= obj[i].rotation
	obj[i].view:addEventListener( "preCollision", hit)
	obj[i].view.c = 0 --conta quante volte in una singola sessione di tiro è stato colpito verticalmente
	obj[i] = obj[i].view
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
      print(partitaS:personaggio())
    if nil~= composer.getScene("toPlay") then composer.removeScene("toPlay", false) end
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
