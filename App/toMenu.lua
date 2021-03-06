--Schermate di presenazione
local composer = require( "composer" )
local scene = composer.newScene()
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
local physics = require ("physics")
physics.start()
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
local esci= true 


function editAlphaTitle()
  if (title~=nil and title.alpha~=nil) then 
  if (title.alpha < 1) then 
    title.alpha= title.alpha + 0.1 
    timer.performWithDelay(50, function() editAlphaTitle() end )
  end
end
end



function editAlphaTip(isGrowing)
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
if continue.alpha== 0 then 
  timer.performWithDelay(3000, function() editAlphaTip(isGrowing) end )
else
 timer.performWithDelay(30, function() editAlphaTip(isGrowing) end )
end
end
end

---**********************************************animazioni crimson--
function flipDestra()
  if (crimson~=nil and esci) then 
transition.to( crimson, { time=10, xScale = 0.198571, onComplete=versoDestra} )
end
end

function versoDestra()
  if (crimson~=nil and esci) then 
  transition.to( crimson, { time=12000, x=(crimson.x+ 550), delay= 1000, onComplete=flipSinistra} )
end
end 

function flipSinistra()
  if (crimson~=nil and esci) then 
  transition.to( crimson, { time=10, xScale = -0.198571, onComplete=versoSinistra} )
end
end

function versoSinistra()
  if (crimson~=nil and esci) then 
  transition.to( crimson, { time=12000, delay= 500, x=(crimson.x- 550), onComplete=flipDestra} )
end
end 
---**********************************************animazioni crimson--

---**********************************************animazioni cottonBall--
-- inizio rotazione
local function ruotaPgSinistra()
  print( "ruota sinistra" )
  if (cottonBall~=nil) then 
    transition.to( cottonBall, { time=100000, rotation =  -36000 , onComplete=ruotaPgDestra} )
  end
end
--Runtime:addEventListener("enterFrame", function() print(cottonBall.rotation) end)
local function ruotaPgDestra()
  print( "ruota destra" )
  if (cottonBall~=nil) then 
    transition.to( cottonBall, { time=100000, rotation = 36000, onComplete=ruotaPgSinistra} )
  end
end
--fine rotazione

--inizio movimento


function versoMetaYDestra()
  if (cottonBall~=nil and esci) then 
  transition.to( cottonBall, { time=1200, x=275, y= 240, onComplete=versoMetaXGiu} )
end
end 

function versoMetaXGiu()
  if (cottonBall~=nil and esci) then 
  transition.to( cottonBall, { time=1000, x= 160, y= 435, onComplete=versoMetaYSinistra} )
end
end 

function versoMetaYSinistra()
  if (cottonBall~=nil and esci) then 
  transition.to( cottonBall, { time=1000, x= 45,y= 240 , onComplete=versodueterziYDestra} )
end
end 

function versodueterziYDestra()
  if (cottonBall~=nil and esci) then 
  transition.to( cottonBall, { time=1000, x=275 ,y= 160, onComplete=versoPosizioneIniziale} )
end

end function versoPosizioneIniziale()
  if (cottonBall~=nil and esci) then 
  transition.to( cottonBall, { time=1000, x= 45, y= 45, onComplete=versoMetaYDestra} )
end
end 





--fine movimento
---**********************************************animazioni cottonBall--

function animazioniPersonaggio() 
  ruotaPgDestra()
  versoMetaYDestra()
  versoDestra()
end 

-- Called when the scene's view does not exist:
function scene:create( event )
  partitaS:soundSave()
  exit= false
    -- view is not yet visible
    local sceneGroup = self.view
	display.setDefault( 'background',  0 / 255, 0 / 255, 0 / 255, 255 / 255)
  --coloro il background di default

	print ("toMenu - create")

  background = display.newImage(composer.imgDir .. "sfondoConTorre.png.jpg", _W/2 - 40, _H/2, true)
  background.xScale= 0.7
background.height= 480

  myLevel= LD_Loader:new(sceneGroup)
  myLevel:loadLevel("primaPagina")

  cottonBall= myLevel:getLayerObject("Layer 1", "batuffolo_1").view
  crimson= myLevel:getLayerObject("Layer 1", "crimsonWalk_5").view

  cottonBall.x= 45
  cottonBall.y= 45
  crimson.y= 440
  title= display.newImage(composer.imgDir.."towerOfBricks.png", _W/2, _H/2 - 150)
  title.width= 200
  title.height= 200
  title.alpha=0

  continue= display.newImage(composer.imgDir.."tts.png", _W/2, _H/2 + 125)
  continue.width= 300
  continue.height= 150
  continue.alpha= 0


	sceneGroup:insert(background)
  sceneGroup:insert(crimson)
  sceneGroup:insert(cottonBall)
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
      local channel1 = audio.findFreeChannel(1)
    audio.setVolume( partitaS:volumeMusica(), {channel=channel1}  )
    audio.play(menuSound, {loops=-1, channel=channel1, fadein= 1000})

print ("toMenu - show")

timer.performWithDelay(500, function()
      editAlphaTitle()
    end)

  timer.performWithDelay(3000, function()
      timer.performWithDelay(100, editAlphaTip(isGrowing))
    end)


		local function onstartEvent(event)

       local channel2= audio.findFreeChannel(2)
       audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
       audio.play(tapSound,{channel= channel2})
       crimson:removeSelf()
       cottonBall:removeSelf()
       continue:removeSelf()
       title:removeSelf()
       esci= false 

			local options = { effect = "crossFade", time = 200}
			self:removeEventListener( "tap", onstartEvent )
			composer.gotoScene( "menu", options )
			return true
		end

		background:addEventListener("tap", onstartEvent )

   
    animazioniPersonaggio() 

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
