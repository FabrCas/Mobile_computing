--Schermate di presenazione
local composer = require( "composer" )
local scene = composer.newScene()

local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
local btnStart = nil



-- Called when the scene's view does not exist:
function scene:create( event )
    -- view is not yet visible
    local sceneGroup = self.view

	display.setDefault( 'background',  0 / 255, 0 / 255, 0 / 255, 255 / 255)
  --coloro il background di default

	print ("toMenu")
	btnStart = display.newText("Touch the screen\n       to start", _W/2, (_H/2)+ 80,native.systemFontBold, 30)
	btnStart:setFillColor(255, 255, 255)
	sceneGroup:insert(btnStart)

end -- ends scene:create

-- Called when the scene's view is about to 'will/load' or 'did/appear':
function scene:show( event )
   local sceneGroup = self.view

   if event.phase == "did" then
      -- purges previous and next scenes
      if nil~= composer.getScene("menu") then composer.removeScene("menu", true) end

		-- Button event listeners

		local function onstartEvent(event)
			local options = { effect = "crossFade", time = 200}
			self:removeEventListener( "tap", onstartEvent )
			composer.gotoScene( "menu", options )
			return true
		end

		btnStart:addEventListener("tap", onstartEvent )


   end --ends phase did

end -- ends scene:show

function scene:hide( event )
   -- all disposal happens here
   if event.phase == "will" then
   elseif event.phase == "did" then
          composer.test = nil
   end
end

function scene:destroy( event )
   -- Remove all unecessary composer items
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
