--Schermate di presenazione
local composer = require( "composer" )
local scene = composer.newScene()
require ("lib.partita")

local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
local btnStart = nil
menuSound= audio.loadStream("sounds/montage.mp3")



-- Called when the scene's view does not exist:
function scene:create( event )
    -- view is not yet visible
    local sceneGroup = self.view
    if audio.isChannelActive( 1 )== false then
  local channel1 = audio.findFreeChannel(1)
    audio.setVolume( partita:volumeMusica(), {channel=channel1}  )
    audio.play(menuSound, {loops=-1, channel=channel1, fadein= 1000})
  end
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
     if nil~= composer.getScene("levels.scene1") then composer.removeScene("levels.scene1", false) end
     if nil~= composer.getScene("scene1") then composer.removeScene("scene1", false) end
    -- Button event listeners
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
