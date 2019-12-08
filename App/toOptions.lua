local composer = require( "composer" )
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
local physics = require ("physics")
physics.start()
tapSound1= audio.loadSound("sounds/mb1.mp3")
tapSound2= audio.loadSound("sounds/brickStricked.mp3")

local scene = composer.newScene()
local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
local testoVolumeMusica
local testoVolumeEffettoSonoro
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------









-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
local sceneGroup= self.view


    --listener
local function onButtonClickUpMusica(event)
    partitaS:aumentaVolumeMusica()
    audio.setVolume( partitaS:volumeMusica(), {channel=1}  )
    testoVolumeMusica.text= (partitaS:volumeMusica() * 10)
    audio.play(tapSound2,{channel= 2})

end

local function onButtonClickDownMusica(event)
    partitaS:diminuisciVolumeMusica()
    audio.setVolume( partitaS:volumeMusica(), {channel=1}  )
    if (partitaS:volumeMusica()*10)>0 and (partitaS:volumeMusica()*10)<1  then
        testoVolumeMusica.text= 0
    else
    testoVolumeMusica.text= (partitaS:volumeMusica() * 10)
end
audio.play(tapSound2,{channel= 2})
end

local function onButtonClickDownEffettoSonoro(event)
    partitaS:diminuisciVolumeEffettoSonoro()
    audio.setVolume(partitaS:volumeEffettoSonoro(), {channel=2}  )
    if (partitaS:volumeEffettoSonoro()*10)>0 and (partitaS:volumeEffettoSonoro()*10)<1  then
        testoVolumeEffettoSonoro.txt=0
    else
    testoVolumeEffettoSonoro.text= (partitaS:volumeEffettoSonoro() * 10)

end
audio.play(tapSound2,{channel= 2})
end

local function onButtonClickUpEffettoSonoro(event)
     partitaS:aumentaVolumeEffettoSonoro()
    audio.setVolume(partitaS:volumeEffettoSonoro(), {channel=2} )
    testoVolumeEffettoSonoro.text= (partitaS:volumeEffettoSonoro() * 10)
    audio.play(tapSound2,{channel= 2})
end

local function onButtonEsci(event)
    composer.gotoScene( "menu" , { effect = "crossFade", time = 200})
    audio.play(tapSound,{channel= 2})
end

local function onButtonCrediti(event)
    composer.gotoScene( "toCredits" , { effect = "crossFade", time = 200})
    audio.play(tapSound,{channel= 2})
end

    local sceneGroup = self.view

     local background = display.newImage(composer.imgDir .. "bg.jpg", 0, 0, true)
    background.anchorX = 0
    background.anchorY = 0
    sceneGroup:insert(background)
    myLevel= LD_Loader:new(sceneGroup)
    myLevel:loadLevel("opzioni")
    -- Code here runs when the scene is first created but has not yet appeared on screen
--bottoni
   local bottoneUpMusica = myLevel:getLayerObject("bottoni", "button_3").view
    local bottoneDownMusica = myLevel:getLayerObject("bottoni", "button_4").view
    local bottoneUpEffettoSonoro = myLevel:getLayerObject("bottoni", "button_1").view
    local bottoneDownEffettoSonoto =  myLevel:getLayerObject("bottoni", "button_2").view
    local bottoneEsci = myLevel:getLayerObject("bottoni", "button_5").view
    local bottoneCredits = myLevel:getLayerObject("bottoni", "button_6").view



    --aggiungo i listerner

    bottoneUpMusica:addEventListener("tap", onButtonClickUpMusica)
    bottoneDownMusica:addEventListener("tap", onButtonClickDownMusica)
    bottoneUpEffettoSonoro:addEventListener("tap", onButtonClickUpEffettoSonoro)
    bottoneDownEffettoSonoto:addEventListener("tap", onButtonClickDownEffettoSonoro)
    bottoneEsci:addEventListener("tap", onButtonEsci)
    bottoneCredits:addEventListener("tap", onButtonCrediti)


function creaNumeroMusica(valore, rectValoreMusica) 
    print ("valore :" .. valore )
    local char1=valore:sub(0,1)
if not valore[1]== nil then 
    local char2=valore:sub(1,2)
    --due oggetti
end
  num=  display.newImage(composer.imgDir .. char1 .. ".png" ,rectValoreMusica.x ,rectValoreMusica.y)
   print (char1)
   print (char2)
   return num
end

function creaNumeroEffetto(valore, rectValoreEffettoSonoro)
        print ("valore :" .. valore )
    local char1=valore:sub(0,1)
if not valore[1]== nil then 
    local char2=valore:sub(1,2)
    --due oggetti
end
num= display.newImage(composer.imgDir .. char1 .. ".png" ,rectValoreEffettoSonoro.x ,rectValoreEffettoSonoro.y)
return num
end


--rect
    local rectValoreMusica = myLevel:getLayerObject("Layer 1", "rect_3").view
    local rectValoreEffettoSonoro = myLevel:getLayerObject("Layer 1", "rect_2").view

    testoVolumeMusica= creaNumeroMusica(tostring((partitaS:volumeMusica() * 10)), rectValoreMusica)
    testoVolumeEffettoSonoro= creaNumeroEffetto(tostring((partitaS:volumeEffettoSonoro() * 10)),rectValoreEffettoSonoro)
   
    sceneGroup:insert(testoVolumeEffettoSonoro)
    sceneGroup:insert(testoVolumeMusica)

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        --if nil~= composer.getScene("menu") then composer.removeScene("menu", false) end
if nil~= composer.getScene("menu") then composer.removeScene("menu", false) end
    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene


