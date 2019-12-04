local composer = require( "composer" )
local scene = composer.newScene()
local slideView = require("lib.carousel_livelli")
require ("lib.partitaArcade")

local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
local touch = {}
local levelGroup=nil
local clicked = 0
local numeroPagineMenu= 30


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
    print("menuArcade-> create")

     local background = display.newImage(composer.imgDir .. "bg.jpg", 0, 0, true)
    background.anchorX = 0
    background.anchorY = 0
    sceneGroup:insert(background)

     local images = {}

  images[0] = {image = composer.imgDir .. "0.png"}
  images[1] = {image = composer.imgDir .. "1.png"}
  images[2] = {image = composer.imgDir .. "2.png"}
  images[3] = {image = composer.imgDir .. "3.png"}
  images[4] = {image = composer.imgDir .. "4.png"}
  images[5] = {image = composer.imgDir .. "5.png"}
  images[6] = {image = composer.imgDir .. "6.png"}
  images[7] = {image = composer.imgDir .. "7.png"}
  images[8] = {image = composer.imgDir .. "8.png"}
  images[9] = {image = composer.imgDir .. "9.png"}




  levelGroup = slideView.new( images, nil)
  sceneGroup:insert(levelGroup)

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
    
    elseif ( phase == "did" ) then
        print("menuArcade-> show (did)")
        -- Code here runs when the scene is entirely on screen
        if nil~= composer.getScene("menu") then composer.removeScene("menu", false) end
    local prevScene = composer.getSceneName( "previous" )
        -- remove previous scene's view
    if (prevScene) then
            composer.removeScene( prevScene )
        end

local function runLevel(livello)
    local options =  { effect = "crossFade",
     time = 200,
     params = { nomeLivello = 1}
 }
  print("Run level (Arcade) eseguita")

    if livello == 1 then
        options.params.nomeLivello= 1
    elseif livello == 2 then
        options.params.nomeLivello= 2
     elseif livello == 3 then
        options.params.nomeLivello= 3
     elseif livello == 4 then
        options.params.nomeLivello= 4
     elseif livello == 5 then
        options.params.nomeLivello= 5
     elseif livello == 6 then
        options.params.nomeLivello= 6
     elseif livello == 7 then
        options.params.nomeLivello= 7
     elseif livello == 8 then
        options.params.nomeLivello= 8
     elseif livello == 9 then
        options.params.nomeLivello= 9
     elseif livello == 10 then
        options.params.nomeLivello= 10
     elseif livello == 11 then
        options.params.nomeLivello= 11
     elseif livello == 12 then
        options.params.nomeLivello= 12
     elseif livello == 13 then
        options.params.nomeLivello= 13
     elseif livello == 14 then
        options.params.nomeLivello= 14
     elseif livello == 15 then
        options.params.nomeLivello= 15
     elseif livello == 16 then
        options.params.nomeLivello= 16
     elseif livello == 17 then
        options.params.nomeLivello= 17
     elseif livello == 18 then
        options.params.nomeLivello= 18
     elseif livello == 19 then
        options.params.nomeLivello= 19
     elseif livello == 20 then
        options.params.nomeLivello= 20
     elseif livello == 21 then
        options.params.nomeLivello= 21
     elseif livello == 22 then
        options.params.nomeLivello= 22
     elseif livello == 23 then
        options.params.nomeLivello= 23
     elseif livello == 24 then
        options.params.nomeLivello= 24
     elseif livello == 25 then
        options.params.nomeLivello= 25
     elseif livello == 26 then
        options.params.nomeLivello= 26
     elseif livello == 27 then
        options.params.nomeLivello= 27
     elseif livello == 28 then
        options.params.nomeLivello= 28
     elseif livello == 29 then
        options.params.nomeLivello= 29
     elseif livello == 30 then
        options.params.nomeLivello= 30
    end
    composer.gotoScene( "selectPGArcade", options)
    return true
end


local function onLevelSelected(event)
    clicked = clicked + 1
    if (clicked ==1) then
        Runtime:removeEventListener("levelClicked")
        --levelGroup:cleanUp() MESSO TRA I COMMENTI PER FAR FUNZIONARE IL BACKTOMENU
        print (clicked, "clicked level", event.level)
        timer.performWithDelay(0,  runLevel(event.level) ,1)
    end
end
Runtime:addEventListener("levelClicked", onLevelSelected)
 end
end
-- hide()
function scene:hide( event )
   print("menuArcade-> hide")
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 Runtime:removeEventListener("levelClicked")
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 levelGroup = nil
print (" page_Arcade destroyed")
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