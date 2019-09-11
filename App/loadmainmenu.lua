--loadmainmenu

local composer = require ("composer")
local scene = composer.newScene()

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local myTimer
local loading

-- Called when the scene's view does not exist:
function scene:create( event )
  local sceneGroup = self.view

  print( "\nloadmainmenu: creazione evento" )
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
  local sceneGroup = self.view

  print( "loadmainmenu: show event" )
local options = 
{
  text= "caricamento in corso...",
  alpha=1,
  font= system.systemFont,
  x = display.contentCenterX; y = display.contentCenterY,
  align= "left",
  fontSize= 20
  }
  loading = display.newText(options)
  loading:setFillColor(0.5, 0.5, 0)
  
  sceneGroup:insert( loading )

  local goToMenu = function()
    composer.gotoScene( "mainmenu", "crossFade", 500 )
  end
  myTimer = timer.performWithDelay( 1000, goToMenu, 1 )

end


-- Called when scene is about to move offscreen:
function scene:hide()

  if myTimer then timer.cancel( myTimer ); end

  print( "loadmainmenu: hide event" )

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )

  print( "destroying loadmainmenu's view" )
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "create" event is dispatched if scene's view does not exist
scene:addEventListener( "create", scene )

-- "show" event is dispatched whenever scene transition has finished
scene:addEventListener( "show", scene )

-- "hide" event is dispatched before next scene's transition begins
scene:addEventListener( "hide", scene )

-- "destroy" event is dispatched before view is unloaded, which can be
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene