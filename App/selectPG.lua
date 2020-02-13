--scena per scegliere il parsonaggio
local composer = require( "composer" )
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
--local physics = require ("physics")
local _W = display.contentWidth
local _H = display.contentHeight
--physics.start()
tapSound= audio.loadSound("sounds/mb1.mp3")
local preference = require "lib.preference"

local scene = composer.newScene()
local arcade
local livello
local rectButton
local rectButton2
local backButton
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
      composer.gotoScene("levels.scene"..tostring(livello),options) end
end


local function onButtonClick(event)
  rimuoviListener()
  nomePersonaggio= event.target.pg
  print ("Select PG = " .. nomePersonaggio .. " " .. mod_par)
  --print("tap esiste?")
  --print(tapSound==nil)
  local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
  audio.play(tapSound,{channel= channel2})
  partitaS:setPG(nomePersonaggio)
  if mod_par=="tower" then 
  preference.save{pg=nomePersonaggio}
end 
  if nomePersonaggio== "cottonBall" then
  pg= myLevel:getLayerObject("PGs", "cottonBall").view --sostituire "cottonBall" con nomePersonaggio
  pg:play()
  timer.performWithDelay( 1000 , function() chiamaProssimaScena() end)
elseif nomePersonaggio=="crimson" then
  pg= myLevel:getLayerObject("PGs", "crimson").view 
  pg:play()
  timer.performWithDelay( 70  , function() 
  transition.to( pg, { time=3500, x=(pg.x+ 140), onComplete=chiamaProssimaScena} )
  end)
end 
  -- chiamaProssimaScena()  -- DA TOGLIERE POI E RIMETTERE PARTI COMMENTANTE SOPRA 
  return true
end

local function backClicked(event)
  rimuoviListener()
  local options = { effect = "crossFade", time = 200}
   local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
  audio.play(tapSound,{channel= channel2})
    if mod_par == "tower" then composer.gotoScene( "menu", options ) else
      composer.gotoScene("arcade",options) end
  end

function rimuoviListener()
  rectButton.view:removeEventListener("tap", onButtonClick)
  rectButton2.view:removeEventListener("tap", onButtonClick)
  backButton:removeEventListener("tap", backClicked)
end
-- create()
function scene:create( event )

    local sceneGroup = self.view
    if (mod_par=="arcade") then 
    livello= event.params.nomeLivello
  end 
    display.setDefault( 'background',  0 / 255, 0 / 255, 0 / 255, 255 / 255)
    -- Code here runs when the scene is first created but has not yet appeared on screen
    myLevel= LD_Loader:new(sceneGroup)
    myLevel:loadLevel("sceltaPersonaggio")


--aggungere gli altri bottoni per gli altri personaggi
      rectButton= myLevel:getLayerObject("backgrounds", "rect_pg1")
      rectButton2= myLevel:getLayerObject("backgrounds", "rect_pg2")

      crimson= myLevel:getLayerObject("PGs", "crimson").view 
      crimsonScroll= myLevel:getLayerObject("PGs", "scroll-crimson_0").view
      cb= myLevel:getLayerObject("PGs", "cottonBall").view
      cbScroll= myLevel:getLayerObject("PGs", "scroll-b_0").view
      window= myLevel:getLayerObject("wallPGs", "wall_0").view
      back= myLevel:getLayerObject("ui", "back_0").view

      sceneGroup:insert(rectButton.view)
      sceneGroup:insert(rectButton2.view)
      sceneGroup:insert(crimson)
      sceneGroup:insert(window)
      sceneGroup:insert(crimsonScroll)
      sceneGroup:insert(cb)
      sceneGroup:insert(cbScroll)
      sceneGroup:insert(back)



      --crimson:toBack()
      
      backButton= myLevel:getLayerObject("ui", "back_0").view
      --.view lo fa diventare un display object, per le proprietà io deve accedere alla table
      -- quindi non la devo mettere
    --  rectButton.view.alpha= 1
    --  print(rectButton.property['pgName'])
    --  print(rectButton)
    --  print(rectButton.view)
  rectButton.view.pg= rectButton.property['pgName']
   rectButton2.view.pg= rectButton2.property['pgName']
  --print (rectButton.view.pg)
      rectButton.view:addEventListener("tap", onButtonClick) --onButtonClick(event, rectButton.property['pgName']) end )
      rectButton2.view:addEventListener("tap", onButtonClick)
      backButton:addEventListener("tap", backClicked)

      
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
        -- if nil~= composer.getScene("arcade") then composer.removeScene("arcade", false) end
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
