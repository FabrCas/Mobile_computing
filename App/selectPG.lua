--scena per scegliere il parsonaggio
local composer = require( "composer" )
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
local physics = require ("physics")
local _W = display.contentWidth
local _H = display.contentHeight
physics.start()

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------



-- create()
function scene:create( event )

    local sceneGroup = self.view
    display.setDefault( 'background',  0 / 255, 0 / 255, 0 / 255, 255 / 255)
    -- Code here runs when the scene is first created but has not yet appeared on screen
    myLevel= LD_Loader:new(sceneGroup)
    myLevel:loadLevel("sceltaPersonaggio")


    function onButtonClick(event, nomePersonaggio)
      local options = { effect = "crossFade", time = 200}
      print(nomePersonaggio)
      partitaS:setPG(nomePersonaggio)
      pg= myLevel:getLayerObject("PGs", "cottonBall").view
      timer.performWithDelay( 3000 , composer.gotoScene( "toPlay", options ))
      pg:play()
      return true
    end

--aggungere gli altri bottoni per gli altri personaggi
      rectButton= myLevel:getLayerObject("backgrounds", "rect_pg1")
      --.view lo fa diventare un display object, per le proprietà io deve accedere alla table
      -- quindi non la devo mettere
      rectButton.view.alpha= 1
    --  print(rectButton.property['pgName'])
    --  print(rectButton)
    --  print(rectButton.view)

      rectButton.view:addEventListener("tap", function(event) onButtonClick(event,rectButton.property['pgName']) end ) --onButtonClick(event, rectButton.property['pgName']) end )
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

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
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
