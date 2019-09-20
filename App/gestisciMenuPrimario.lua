local composer = require( "composer" )
local scene = composer.newScene()

-- External libraries


-- Called when the scene's view does not exist:
function scene:create( event )
  display.setDefault( 'background',  195 / 255, 195 / 255, 195 / 255, 255 / 255)
  sceneGroup = self.view

end

-- Called when the scene's view is about to 'will/load' or 'did/appear':
function scene:show( event )


	if event.phase == "did" then
    print("logging")
    if nil~= composer.getScene("menu") then composer.removeScene("menu", false) end
end

local options = { effect = "crossFade", time = 200}
if composer.level == 2 then
  composer.gotoScene( "toPlay", options)
  return true
elseif composer.level == 3 then
  composer.gotoScene( "toOptions", options )
  return true
elseif composer.level == 1 then
  composer.gotoScene( "toMenu" , options )
  return true
end
end



function scene:hide( event )
     -- all disposal happens here
   if event.phase == "will" then
   elseif event.phase == "did" then
	  print ("gestisciMenuPrimario removed")
   end
end


function scene:destroy( event )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
