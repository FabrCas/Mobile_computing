--Schermate di presenazione
local composer = require( "composer" )
local scene = composer.newScene()
require ("lib.partitaStoria")

local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
local btnStart = nil
menuSound= audio.loadStream("sounds/montage.mp3")
tapSound= audio.loadSound("sounds/mb1.mp3")
local background
local continue
local cottonBall
local crimson
local title
local exit

function editAlpha(isGrowing)
if (continue~=nil and continue.alpha~=nil) then 
  if (isGrowing==true) then 
      continue.alpha= continue.alpha + 0.1
      if continue.alpha== 1 then
        isGrowing= false
      end
  else
    continue.alpha= continue.alpha - 0.1
    if continue.alpha== 0 then
        isGrowing= true
    end
  end
 timer.performWithDelay(30, function() editAlpha(isGrowing) end )
end
end



-- Called when the scene's view does not exist:
function scene:create( event )
  exit= false
    -- view is not yet visible
    local sceneGroup = self.view
  local channel1 = audio.findFreeChannel(1)
    audio.setVolume( partitaS:volumeMusica(), {channel=channel1}  )
    audio.play(menuSound, {loops=-1, channel=channel1, fadein= 1000})
	display.setDefault( 'background',  0 / 255, 0 / 255, 0 / 255, 255 / 255)
  --coloro il background di default

	print ("toMenu - create")

  background = display.newImage(composer.imgDir .. "bg.jpg", 0, 0, true)
  background.anchorX = 0
  background.anchorY = 0

  title= display.newImage(composer.imgDir.."towerOfBricks.png", _W/2, _H/2 - 150)
  title.width= 200
  title.height= 200

  continue= display.newImage(composer.imgDir.."tts.png", _W/2, _H/2 + 125)
  continue.width= 300
  continue.height= 150
  continue.alpha= 0


	sceneGroup:insert(background)
  sceneGroup:insert(title)
  sceneGroup:insert(continue)

end -- ends scene:create

-- Called when the scene's view is about to 'will/load' or 'did/appear':
function scene:show( event )

   local sceneGroup = self.view
   local isGrowing = true 
   if event.phase == "will" then
   
   end
   if event.phase == "did" then

print ("toMenu - show")

  timer.performWithDelay(3000, function()
      timer.performWithDelay(100, editAlpha(isGrowing))
    end)

		local function onstartEvent(event)

       local channel2= audio.findFreeChannel(2)
       audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
       audio.play(tapSound,{channel= channel2})
       continue:removeSelf()
       title:removeSelf()
			local options = { effect = "crossFade", time = 200}
			self:removeEventListener( "tap", onstartEvent )
			composer.gotoScene( "menu", options )
			return true
		end

		background:addEventListener("tap", onstartEvent )


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
