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
require("lib.LD_HelperX")

_W = display.contentWidth
_H = display.contentHeight
partitaS:new()
local f = require("lib.funzioni")
--livelloBase:new() -- qui viene creato il livello
local damage = partitaS:stats().danno
nMattoni = 0 --numero dei mattoni

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local btn = nil
local myLevel = {}
function getLevel()
	return myLevel
end
-- Called when the scene's view does not exist:
function scene:create( event )
  

	--[[ Touch event listener for button
	function onButtonClick( event )
		print ("touch")
		if event.phase == "began" then
			composer.gotoScene( "scene2", "zoomOutInFade", 300  )
			return true
		end
	end

	-- btn = myLevel:getLayerObject( "layer1","btnNext" )
	-- btn.onPress = onButtonClick ]]

	print( "\n1: create event")
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local phase = event.phase

    if ( phase == "will" ) then
    	partitaS:prova()
  print(partitaS:provaVar())
	local screenGroup = self.view
	--local myLevel = {}
	myLevel = LD_Loader:new(self.view)
	myLevel:loadLevel("Level01") -- set your scene/level name here
	myCannon = LD_Loader:new(self.view)
	myCannon:loadLevel("shoot")
	_G.cannone = myCannon:getLayerObject("LayerCannone", "cannon_fire_0").view

    f.creaCannone(cannone)
	f.creaUI(self.view)
    f.creaLivello(cannone)
    
    -- aggiunta listener ai mattoni
	local obj = {}
	for i=1,29 do
	obj[i] = {}
	obj[i] = myLevel:getLayerObject("Layer 1","Brick_"..string.format(i))
	screenGroup:insert(obj[i].view)
	obj[i].view.name= obj[i].property['tipo']
    obj[i].view.life = 5
  obj[i].view.scritta= display.newText(obj[i].view.life, obj[i].view.x, obj[i].view.y )
  screenGroup:insert(obj[i].view.scritta)
  obj[i].view.scritta.rotation = obj[i].view.rotation
	obj[i].view:addEventListener( "preCollision", function (event) f.hit(event) end)
	obj[i].view.c = 0 --conta quante volte in una singola sessione di tiro è stato colpito verticalmente
	obj[i] = obj[i].view
	nMattoni = nMattoni + 1
	end
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
      print(partitaS:personaggio())
    if nil~= composer.getScene("toPlay") then composer.removeScene("toPlay", false) end
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
	--	local prevScene = composer.getSceneName( "previous" )
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

	--myLevel:removeLevel()
	--myLevel = nil
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
