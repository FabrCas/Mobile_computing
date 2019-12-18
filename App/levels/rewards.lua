local composer = require( "composer" )
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
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
    -- Code here runs when the scene is first created but has not yet appeared on screen
    myLevel= LD_Loader:new(sceneGroup)
    myLevel:loadLevel("slot")

    local uno= myLevel:getLayerObject("Layer 1", "1Sheet_0").view
    local due=myLevel:getLayerObject("Layer 1", "2Sheet_0").view
    local tre=myLevel:getLayerObject("Layer 1", "3Sheet_0").view
    local quattro=myLevel:getLayerObject("Layer 1", "4Sheet_0").view
    local cinque=myLevel:getLayerObject("Layer 1", "5Sheet_0").view
    local slot = myLevel:getLayerObject("Layer 1", "5Sheet_0").view
    local up =myLevel:getLayerObject("Layer 1", "5Sheet_0").view
    local down = myLevel:getLayerObject("Layer 1", "5Sheet_0").view
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
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