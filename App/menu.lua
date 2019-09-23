local composer = require( "composer" )
local scene = composer.newScene()
local slideView = require("lib.carousel_menu")

-- Initial settings and checkings
local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
local touch = {}
local levelGroup=nil
local clicked = 0
local numeroPagineMenu= 2

-- Called when the scene's view does not exist:
function scene:create( event )
    -- view is not yet visible
    local sceneGroup = self.view
print("menu-> create")
--	display.setDefault( 'background',  0 / 255, 0 / 255, 0 / 255, 255 / 255)
  --sceneGroup:insert(bg)


	-- Insert your own background
	 local background = display.newImage(composer.imgDir .. "bg.jpg", 0, 0, true)
	background.anchorX = 0
  background.anchorY = 0
	sceneGroup:insert(background)

	--set images for carousel
	-- table item is { unlocked image, locked image, locked}
	local images = {
	{image = composer.imgDir .. "play.png"},
	{image = composer.imgDir .. "options.png"}
	}

--  livelli.livelliDaCreare = numeroPagineMenu
--  livelli.daLivello = 1 -- parto ad assegnare il livello 2, visto che il primo è del menu
	levelGroup = slideView.new( images, nil, livelli)


	-- this automatically move to the last selected level

	sceneGroup:insert(levelGroup)

end -- ends scene:create

-- Called when the scene's view is about to 'will/load' or 'did/appear':
function scene:show( event )

   local sceneGroup = self.view

   if event.phase == "did" then
     print("menu-> show (did)")
      -- purges previous and next scenes
      if nil~= composer.getScene("toPlay") then composer.removeScene("toPlay", false) end
      if nil~= composer.getScene("toOption") then composer.removeScene("toOption", false) end
      if nil~= composer.getScene("toMenu") then composer.removeScene("toMenu", false) end


	local function runLevel(livello)
	--	composer.gotoScene( "gestisciMenuPrimario" , { effect = "crossFade", time = 200})
  if livello == 1 then
    composer.gotoScene( "toPlay", options)
    return true
  elseif livello == 2 then
    composer.gotoScene( "toOptions", options )
    return true
	end
end

	local function onLevelSelected(event)
		clicked = clicked + 1
		if (clicked ==1) then
			Runtime:removeEventListener("levelClicked")
			levelGroup:cleanUp()
			print (clicked, "clicked level", event.level)
			timer.performWithDelay(0,  runLevel(event.level) , 1 )
		end
	end

	Runtime:addEventListener("levelClicked", onLevelSelected)

   end --ends phase did

end -- ends scene:show

function scene:hide( event )
  print("menu-> hide")
   -- all disposal happens here
   if event.phase == "will" then
		Runtime:removeEventListener("levelClicked")

		levelGroup:cleanUp()

   elseif event.phase == "did" then
        composer.test = nil
		levelGroup = nil
		print ("page_2 destroyed")
   end
end

function scene:destroy( event )
  print("menu-> destroy")
   -- Remove all unecessary composer items
   composer.pageSwap = nil
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
