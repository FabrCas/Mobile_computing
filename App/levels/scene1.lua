---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
--sceglieri qui partita storia o no

local scene = composer.newScene()
require("lib.LD_LoaderX")
<<<<<<< HEAD
=======
require("lib.LD_HelperX")
>>>>>>> 05579849e50885a4dba71a94881f108423736b8a

_W = display.contentWidth
_H = display.contentHeight

local f
--livelloBase:new() -- qui viene creato il livello

local modalita
nMattoni= 0
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

print("la modalità è: ".. mod_par)
if mod_par == "tower" then
	print("richiesta modalita tower = " .. mod_par)
	f =  require("lib.funzioni")
elseif mod_par == "arcade" then
	print("richiesta modalita arcade = " .. mod_par)
	f =  require("lib.funzioni")
	--f = require("lib.funzioniArcade")
end
audio.stop(1)

local evento
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

end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	evento=event
	local phase = event.phase
audio.pause(1)
    if ( phase == "will" ) then
    	print("scene1 show - " .. mod_par)
	local screenGroup = self.view
	--local myLevel = {}
	myLevel = LD_Loader:new(self.view)
	myLevel:loadLevel("Level01") -- set your scene/level name here
	myCannon = LD_Loader:new(self.view)
	myCannon:loadLevel("shoot")
	cannone = myCannon:getLayerObject("LayerCannone", "cannon_fire_0").view

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
	obj[i].view:addEventListener( "preCollision", function (event) f.hit(event, modalita) end)
	obj[i].view.c = 0 --conta quante volte in una singola sessione di tiro è stato colpito verticalmente
	obj[i] = obj[i].view
	nMattoni = nMattoni + 1
	end
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
    if nil~= composer.getScene("toPlay") then composer.removeScene("toPlay", false) end
    if nil~= composer.getScene("selectPGArcade") then composer.removeScene("selectPGArcade", false) end
    if nil~= composer.getScene("selectPG") then composer.removeScene("selectPG", false) end
    if nil~= composer.getScene("arcade") then composer.removeScene("arcade", false) end
    if nil~= composer.getScene("menu") then composer.removeScene("menu", false) end
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

    end


end


-- Called when scene is about to move offscreen:
function scene:hide( event )

	print( "scene1 - hide event " .. mod_par )

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )

	--myLevel = nil
	print( "scene 1 - destroy ".. mod_par)
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
