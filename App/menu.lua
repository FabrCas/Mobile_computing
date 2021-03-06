local composer = require( "composer" )
local physics = require ("physics")
local scene = composer.newScene()
local slideView = require("lib.carousel_menu")
tapSound= audio.loadSound("sounds/mb1.mp3")

-- Initial settings and checkings
local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
local touch = {}
local levelGroup=nil
local clicked = 0
local numeroPagineMenu= 3
local preference = require "lib.preference"
local x
local y
if ( system.getInfo("platformName") == "Android" ) then
   local androidVersion = string.sub( system.getInfo( "platformVersion" ), 1, 3)
   if( androidVersion and tonumber(androidVersion) >= 4.4 ) then
     native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )
     --native.setProperty( "androidSystemUiVisibility", "lowProfile" )
   elseif( androidVersion ) then
     native.setProperty( "androidSystemUiVisibility", "lowProfile" )
   end
end

local function tapHighscores(event)
    print("tap highscores")
    local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
  audio.play(tapSound,{channel= channel2})
  local options = { effect = "crossFade", time = 200}
      composer.gotoScene("score",options)
  end

  local function salvaxy(event)
      x= event.x
      y= event.y
  end


-- Called when the scene's view does not exist:
function scene:create( event )

  print("menu - create")
  if nil~= composer.getScene("toMenu") then composer.removeScene("toMenu", false) end
  physics.start()
    -- view is not yet visible
    local sceneGroup = self.view
	menuSound= audio.loadStream("sounds/montage.mp3")
--print("menu-> create")
	-- Insert your own background
	  background = display.newImage(composer.imgDir .. "sfondoConTorre.png.jpg", _W/2 - 40, _H/2, true)
  background.xScale= 0.7
background.height= 480

  background:addEventListener("tap", salvaxy)
	sceneGroup:insert(background)

  local highscores = display.newImage(composer.imgDir .. "scoreSymbol.png",296-4, 461-6)
  a=1.3
  highscores.width = 41*a
  highscores.height = 31.5*a
  sceneGroup:insert(highscores)
  highscores:addEventListener("tap", tapHighscores)

	--set images for carousel
	-- table item is { unlocked image, locked image, locked}
	local images = {
	{image = composer.imgDir .. "TowerMode.png"},
	{image = composer.imgDir .. "ArcadeMode.png"},
  {image = composer.imgDir .. "Options_n.png"}
	}

--  livelli.livelliDaCreare = numeroPagineMenu
--  livelli.daLivello = 1 -- parto ad assegnare il livello 2, visto che il primo è del menu
	levelGroup = slideView.new( images, nil, livelli)
--print(composer.level)

  -- this automatically move to the last selected level
  if (composer.level > 1 ) then
    levelGroup:jumpToImage(composer.level)
  end


	-- this automatically move to the last selected level
	sceneGroup:insert(levelGroup)

end -- ends scene:create

-- Called when the scene's view is about to 'will/load' or 'did/appear':
function scene:show( event )
  
  --local arcade = composer.loadScene( "arcade", false)

   local sceneGroup = self.view
   --if event.phase == "will" then
if ((audio.isChannelActive( 1 ))==false )then
   local channel1 = audio.findFreeChannel(1)
    audio.setVolume( partitaS:volumeMusica(), {channel=channel1}  )
    audio.play(menuSound, {loops=-1, channel=channel1, fadein= 1000})
end
   if event.phase == "did" then
     --print("menu-> show (did)")
 print("menu - show")
      -- purges previous and next scenes
      if nil~= composer.getScene("toPlay") then composer.removeScene("toPlay", false) end
      if nil~= composer.getScene("selectPG") then composer.removeScene("selectPG", false) end
      if nil~= composer.getScene("toOptions") then composer.removeScene("toOptions", false) end
      if nil~= composer.getScene("toMenu") then composer.removeScene("toMenu", false) end
      if nil~= composer.getScene("score") then composer.removeScene("score", false) end
      if nil~= composer.getScene("levels.mappa") then composer.removeScene("levels.mappa", false) end
      if nil~= composer.getScene("levels.scene1") then composer.removeScene("levels.scene1", false) end
      if nil~= composer.getScene("levels.scene2") then composer.removeScene("levels.scene2", false) end
      if nil~= composer.getScene("levels.scene3") then composer.removeScene("levels.scene3", false) end
      if nil~= composer.getScene("levels.scene4") then composer.removeScene("levels.scene4", false) end
      if nil~= composer.getScene("levels.scene5") then composer.removeScene("levels.scene5", false) end
      if nil~= composer.getScene("levels.scene6") then composer.removeScene("levels.scene6", false) end
      if nil~= composer.getScene("levels.scene7") then composer.removeScene("levels.scene7", false) end
      if nil~= composer.getScene("levels.scene8") then composer.removeScene("levels.scene8", false) end
      if nil~= composer.getScene("levels.scene9") then composer.removeScene("levels.scene9", false) end
      if nil~= composer.getScene("levels.scene10") then composer.removeScene("levels.scene10", false) end
      if nil~= composer.getScene("levels.scene11") then composer.removeScene("levels.scene11", false) end
      if nil~= composer.getScene("levels.scene12") then composer.removeScene("levels.scene12", false) end
      if nil~= composer.getScene("levels.scene13") then composer.removeScene("levels.scene13", false) end
      if nil~= composer.getScene("levels.scene14") then composer.removeScene("levels.scene14", false) end
      if nil~= composer.getScene("levels.scene15") then composer.removeScene("levels.scene15", false) end
      if nil~= composer.getScene("levels.scene16") then composer.removeScene("levels.scene16", false) end
      if nil~= composer.getScene("levels.scene17") then composer.removeScene("levels.scene17", false) end
      if nil~= composer.getScene("levels.scene18") then composer.removeScene("levels.scene18", false) end
      if nil~= composer.getScene("levels.scene19") then composer.removeScene("levels.scene19", false) end
      if nil~= composer.getScene("levels.scene20") then composer.removeScene("levels.scene20", false) end
      if nil~= composer.getScene("levels.scene21") then composer.removeScene("levels.scene21", false) end
      if nil~= composer.getScene("levels.scene22") then composer.removeScene("levels.scene22", false) end
      if nil~= composer.getScene("levels.scene23") then composer.removeScene("levels.scene23", false) end
      if nil~= composer.getScene("levels.scene24") then composer.removeScene("levels.scene24", false) end
      if nil~= composer.getScene("levels.scene25") then composer.removeScene("levels.scene25", false) end
      if nil~= composer.getScene("levels.scene26") then composer.removeScene("levels.scene26", false) end
      if nil~= composer.getScene("levels.scene27") then composer.removeScene("levels.scene27", false) end
      if nil~= composer.getScene("levels.scene28") then composer.removeScene("levels.scene28", false) end
      if nil~= composer.getScene("levels.scene29") then composer.removeScene("levels.scene29", false) end
      if nil~= composer.getScene("levels.scene30") then composer.removeScene("levels.scene30", false) end
      if nil~= composer.getScene("levels.insertNick") then composer.removeScene("levels.insertNick", false) end
      if nil~= composer.getScene("arcade") then composer.removeScene("arcade", false) end


      if f ~= nil then f = require("lib.funzioni") end


	local function runLevel(livello)
	--	composer.gotoScene( "gestisciMenuPrimario" , { effect = "crossFade", time = 200})
 -- print("Run level eseguita")
 local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
  audio.play(tapSound,{channel= channel2})
  if livello == 1 then
    mod_par="tower"
 --   print("modalita dal menu scelta tower = " .. mod_par)
   -- print("weeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
    print(preference.getValue("pg"))
   if (preference.getValue("pg")=="gianna" or preference.getValue("pg")==nil )then
    composer.gotoScene("selectPG", { effect = "crossFade", time = 200})
 else
    composer.gotoScene("toPlay", { effect = "crossFade", time = 200})
 end
    return true
  elseif livello == 2 then
    -- inizio animazione caricamento
    local options= {
      width= 256,
      height= 256,
      numFrames= 25,
      sheetContenteWidth= 1024,
      sheetContenteHeight= 2048
    }

    local sheetExplosion = graphics.newImageSheet(composer.imgDir.."loading.png", options)

    local sequenceData = {
      name = "loading", start= 1, count= 25, time = 1000, loopCount= 1000
    }
    loading = display.newSprite (sheetExplosion, sequenceData)
    loading.x= 25
    loading.y= 455
    loading.xScale = 0.2
    loading.yScale = 0.2
    loading:play()

if (not (loading == nil )) then
sceneGroup:insert(loading)
end
--fine animazione caricamento
    mod_par="arcade"
   -- print("modalita dal menu scelta arcade = " .. mod_par)
    composer.gotoScene( "arcade",{ effect = "crossFade", time = 200} )   --in futuro: arcade
    return true
     elseif livello == 3 then
    composer.gotoScene( "toOptions", { effect = "crossFade", time = 200})
    return true
	end
end
_G.evento = nil
	local function onLevelSelected(event)
  if y~=nil and x~=nil then
    print("y="..y) print("x="..x)
		if (y<420) then
      y=440
			Runtime:removeEventListener("levelClicked")
			--levelGroup:cleanUp() MESSO TRA I COMMENTI PER FAR FUNZIONARE IL BACKTOMENU
			--print (clicked, "clicked level", event.level)
		--	timer.performWithDelay(0,  runLevel(event.level) ,1)
    timer.performWithDelay(0,  runLevel(evento) ,1)
		end
  else Runtime:removeEventListener("levelClicked") timer.performWithDelay(0,  runLevel(evento) ,1) end

	end

--	Runtime:addEventListener("levelClicked", onLevelSelected)
  Runtime:addEventListener("levelClicked", function(event) evento=event.level timer.performWithDelay(100,onLevelSelected) end)

   end --ends phase did

end -- ends scene:show

function scene:hide( event )
 -- print("menu-> hide")
   -- all disposal happens here
 if event.phase == "will" then
Runtime:removeEventListener("levelClicked")

--levelGroup:cleanUp() MESSO TRA I COMMENTI PER FAR FUNZIONARE IL BACKTOMENU

 elseif event.phase == "did" then
      composer.test = nil
levelGroup = nil
--print ("page_2 destroyed")
 end



end

function scene:destroy( event )
  print("menu-> destroy")
   -- Remove all unecessary composer items
  composer.pageSwap = nil
  --audio.pause(menuSound)
	--menuSound= nil
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
