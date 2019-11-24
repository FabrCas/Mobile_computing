local composer = require( "composer" )

local scene = composer.newScene()
local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

audio.stop(1)

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    sceneGroup = self.view

   local testoSchermo = display.newText("Tap to play\n [test level]", _W/2, _H/2-30,native.systemFontBold, 20)
   testoSchermo:setFillColor(0.9, 0.1, 0)
   sceneGroup:insert(testoSchermo)


 local function onClick(event)
 local options = { effect = "crossFade", time = 200}
 self:removeEventListener( "tap", onClick )
 --composer.gotoScene( "levels.mappa")
 composer.gotoScene( "levels.scene1" )
 return true
end

   testoSchermo:addEventListener("tap", onClick )
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
        if nil~= composer.getScene("selectPG") then composer.removeScene("selectPG", false) end
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
        print("toPlay page removed")
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
