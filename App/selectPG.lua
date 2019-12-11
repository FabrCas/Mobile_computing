--scena per scegliere il parsonaggio
local composer = require( "composer" )
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
local physics = require ("physics")
local _W = display.contentWidth
local _H = display.contentHeight
physics.start()
--tapSound= audio.loadSound("sounds/mb1.mp3")

local scene = composer.newScene()
local arcade
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


local function chiamaProssimaScena()
    local options = { effect = "crossFade", time = 200}
    if mod_par == "tower" then composer.gotoScene( "toPlay", options ) else
      composer.gotoScene("levels.scene1",options) end
end


local function onButtonClick(event)
  nomePersonaggio= event.target.pg
  print ("Select PG = " .. nomePersonaggio .. " " .. mod_par)
  --print("tap esiste?")
  --print(tapSound==nil)
  local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
  audio.play(tapSound,{channel= channel2})
  partitaS:setPG(nomePersonaggio)
  pg= myLevel:getLayerObject("PGs", "cottonBall").view
  --timer.performWithDelay( 10000 , composer.gotoScene( "toPlay", options ))
  pg:play()
  chiamaProssimaScena()
  return true
end

local function backClicked(event)
  local options = { effect = "crossFade", time = 200}
    if mod_par == "tower" then composer.gotoScene( "menu", options ) else
      composer.gotoScene("arcade",options) end
  end

-- create()
function scene:create( event )

    local sceneGroup = self.view
    
    display.setDefault( 'background',  0 / 255, 0 / 255, 0 / 255, 255 / 255)
    -- Code here runs when the scene is first created but has not yet appeared on screen
    myLevel= LD_Loader:new(sceneGroup)
    myLevel:loadLevel("sceltaPersonaggio")


--aggungere gli altri bottoni per gli altri personaggi
      rectButton= myLevel:getLayerObject("backgrounds", "rect_pg1")
      backButton= myLevel:getLayerObject("ui", "back_0").view
      --.view lo fa diventare un display object, per le proprietà io deve accedere alla table
      -- quindi non la devo mettere
    --  rectButton.view.alpha= 1
    --  print(rectButton.property['pgName'])
    --  print(rectButton)
    --  print(rectButton.view)
  rectButton.view.pg= rectButton.property['pgName']
  --print (rectButton.view.pg)
      rectButton.view:addEventListener("tap", onButtonClick) --onButtonClick(event, rectButton.property['pgName']) end )
      backButton:addEventListener("tap", backClicked)

       if nil~= composer.getScene("arcade") then composer.removeScene("arcade", false) end
         if nil~= composer.getScene("menu") then composer.removeScene("menu", false) end
         if mod_par == "arcade" then
      arcade = composer.loadScene( "arcade", false)
    end
      --rectButton.onRelease= onButtonClick
end

-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        if nil~= composer.getScene("menu") then composer.removeScene("menu", false) end


    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
      --  audio.pause(menuSound)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    menuSound= nil
    myLevel:removeLevel()
    myLevel=nil
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
