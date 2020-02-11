
-- scene1.lua
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
--sceglieri qui partita storia o no

local scene = composer.newScene()
levelSound= audio.loadSound("sounds/space3.mp3")
require("lib.LD_LoaderX")
require("lib.LD_HelperX")

_W = display.contentWidth
_H = display.contentHeight


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

    if ( phase == "will" ) then
    local isChannel1Active = audio.isChannelActive( 1 )
    if isChannel1Active then
    	audio.stop( 1 )
    	end
    	local channel1= audio.findFreeChannel(1)
    	audio.setVolume( partitaS:volumeMusica(), {channel=channel1}  )
    	audio.play(levelSound,{channel= channel1, loops = -1})
    	
    	print("scene1 show - " .. mod_par)
	local screenGroup = self.view
	--local myLevel = {}
	myLevel = LD_Loader:new(self.view)
	myLevel:loadLevel("Level25") -- set your scene/level name here
	myCannon = LD_Loader:new(self.view)
	myCannon:loadLevel("cannon.shoot")
	cannone = myCannon:getLayerObject("LayerCannone", "cannon_fire_0").view
	cerchio = myCannon:getLayerObject("LayerCannone", "ellipse_2")

	    -- aggiunta listener ai mattoni
	local obj = {}
	for i=1,49 do
	obj[i] = {}
	obj[i] = myLevel:getLayerObject("Layer 1",string.format(i))
	screenGroup:insert(obj[i].view)
	obj[i].view.name = obj[i].property['tipo']
	if not (obj[i].view.name=="unbreak") then 

	if (obj[i].view.name=="speciale") then
	obj[i].view.life = 1
	else 
    obj[i].view.life = 4
    obj[i].view.scritta= display.newText(obj[i].view.life, obj[i].view.x, obj[i].view.y )
  
    if (obj[i].view.name=="g") then 
    	obj[i].view.scritta:setFillColor(0,0,0)
    end 
   screenGroup:insert(obj[i].view.scritta)
  angolo= obj[i].view.rotation
  if angolo > 315 and angolo <45 then  --<
  	obj[i].view.scritta.rotation= obj[i].view.rotation
  elseif angolo >= 45 and angolo < 135 then  --^
  	obj[i].view.scritta.rotation= obj[i].view.rotation -90
  elseif angolo >= 135 and angolo <225 then  -->
  	obj[i].view.scritta.rotation= obj[i].view.rotation +180
   elseif angolo >= 225 and angolo < 315 then --u
  	obj[i].view.scritta.rotation= obj[i].view.rotation +90

  elseif angolo <-315 and angolo >-45 then --<
  obj[i].view.scritta.rotation = obj[i].view.rotation 
elseif angolo <-225 and angolo >-315 then --^
  obj[i].view.scritta.rotation = obj[i].view.rotation -90
elseif angolo <-135 and angolo >=-225 then -->
  obj[i].view.scritta.rotation = obj[i].view.rotation +180
elseif angolo <-45 and angolo >-135 then --u
  obj[i].view.scritta.rotation = obj[i].view.rotation +90
else  obj[i].view.scritta.rotation = obj[i].view.rotation
end 
    end 

	obj[i].view:addEventListener( "preCollision", function (event) f.hit(event, modalita) end)
	obj[i].view.c = 0 --conta quante volte in una singola sessione di tiro è stato colpito verticalmente
	nMattoni = nMattoni + 1
end
	obj[i] = obj[i].view
	end

	sfondo= myLevel:getLayerObject("Layer 1","moonSmile_0").view
    f.creaCannone(cannone,cerchio)
	f.creaUI(self.view)
    f.creaLivello(cannone,obj, sfondo)


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