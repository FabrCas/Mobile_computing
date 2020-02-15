local composer = require( "composer" )
local scene = composer.newScene()


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
    sceneGroup = self.view
    testo= display.newText( "crediti", display.actualContentWidth/2, display.actualContentHeight/2)
testo.width=20
testo= 20
end
 
 
-- show()
function scene:show( event )
 
    sceneGroup = self.view
    local phase = event.phase

       -- testo = display.newText("crediti", display.actualContentWidth/2, display.actualContentHeight/2,native.systemFontBold, 30)
    

    
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        if nil~= composer.getScene("toOptions") then composer.removeScene("toOptions", false) end
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    sceneGroup = self.view
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