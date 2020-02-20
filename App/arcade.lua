local composer = require( "composer" )
local scene = composer.newScene()
local slideView = require("lib.carousel_livelli")

local sceneGroup = nil -- main group for all page elements
local _W = display.contentWidth; -- full width of the page
local _H = display.contentHeight; -- full height of the page
local touch = {}
local levelGroup=nil
local levelGroup2=nil
local clicked = 0
local numeroPagineMenu= 30
local x
local y
menuSound= audio.loadStream("sounds/montage.mp3")
tapSound= audio.loadSound("sounds/mb1.mp3")

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


local function backClicked(event)
    print("back clicked")
    local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
  audio.play(tapSound,{channel= channel2})
  local options = { effect = "crossFade", time = 200}
      composer.gotoScene("menu",options)
  end


local function salvaxy(event)
    x= event.x
    y= event.y
end


-- create()
function scene:create( event )

    local sceneGroup = self.view

    print("menuArcade-> create")

 background = display.newImage(composer.imgDir .. "sfondoConTorre.png.jpg", _W/2 - 40, _H/2, true)
  background.xScale= 0.7
background.height= 480
    background:addEventListener("tap", salvaxy)
    sceneGroup:insert(background)

    local back= display.newImage(composer.imgDir .. "back.png",296, 461)
    back.width = 41
    back.height = 31.5
    --back.xScale=0.205
   -- back.yScale= 0.1575
    sceneGroup:insert(back)
    back:addEventListener("tap", backClicked)
     local images = {}
     local images2 = {}

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

 images[100] = {image = composer.imgDir .. "sl/screen1.jpg"}
 images[101] = {image = composer.imgDir .. "sl/screen1.jpg"}
 images[102] = {image = composer.imgDir .. "sl/screen2.jpg"}
 images[103] = {image = composer.imgDir .. "sl/screen3.jpg"}
 images[104] = {image = composer.imgDir .. "sl/screen4.jpg"}
 images[105] = {image = composer.imgDir .. "sl/screen5.jpg"}
 images[106] = {image = composer.imgDir .. "sl/screen6.jpg"}
 images[107] = {image = composer.imgDir .. "sl/screen9.jpg"}
 images[108] = {image = composer.imgDir .. "sl/screen11.jpg"}
 images[109] = {image = composer.imgDir .. "sl/screen12.jpg"}
 images[110] = {image = composer.imgDir .. "sl/screen13.jpg"}
 images[111] = {image = composer.imgDir .. "sl/screen14.jpg"}
 images[112] = {image = composer.imgDir .. "sl/screen15.jpg"}
 images[113] = {image = composer.imgDir .. "sl/screen17.jpg"}
 images[114] = {image = composer.imgDir .. "sl/screen19.jpg"}
 images[115] = {image = composer.imgDir .. "sl/screen20.jpg"}
 images[116] = {image = composer.imgDir .. "sl/screen21.jpg"}
 images[117] = {image = composer.imgDir .. "sl/screen22.jpg"}
 images[118] = {image = composer.imgDir .. "sl/screen23.jpg"}
 images[119] = {image = composer.imgDir .. "sl/screen25.jpg"}
 images[120] = {image = composer.imgDir .. "sl/screen26.jpg"}
 images[121] = {image = composer.imgDir .. "sl/screen27.jpg"}
 images[122] = {image = composer.imgDir .. "sl/screen30.jpg"}


 images[123] = {image = composer.imgDir .. "notAvailable.png"}
 images[124] = {image = composer.imgDir .. "notAvailable.png"}
 images[125] = {image = composer.imgDir .. "notAvailable.png"}
 images[126] = {image = composer.imgDir .. "notAvailable.png"}
 images[127] = {image = composer.imgDir .. "notAvailable.png"}
 images[128] = {image = composer.imgDir .. "notAvailable.png"}
 images[129] = {image = composer.imgDir .. "notAvailable.png"}
 images[130] = {image = composer.imgDir .. "notAvailable.png"}

  levelGroup = slideView.new( images, nil)
  sceneGroup:insert(levelGroup)


end


-- show()
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase



    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
if ((audio.isChannelActive( 1 ))==false )then
    audio.stop(1)
   local channel1 = audio.findFreeChannel(1)
    audio.setVolume( partitaS:volumeMusica(), {channel=channel1}  )
    audio.play(menuSound, {loops=-1, channel=channel1, fadein= 1000})
end
    elseif ( phase == "did" ) then

        print("menuArcade-> show (did)")
        -- Code here runs when the scene is entirely on screen
        if nil~= composer.getScene("menu") then composer.removeScene("menu", false) end
        if nil~= composer.getScene("selectPG") then composer.removeScene("selectPG", false) end
         --  if nil~= composer.getScene("arcade") then composer.removeScene("arcade", true ) end
    local prevScene = composer.getSceneName( "previous" )
        -- remove previous scene's view
    if (prevScene) then
            composer.removeScene( prevScene )
        end

local function runLevel(liv)
    local options =  { effect = "crossFade",
     time = 200,
     params = { nomeLivello = liv}
 }
  local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
  audio.play(tapSound,{channel= channel2})
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
    _G.livelloA=0
    composer.gotoScene( "selectPG", options)
    return true
end


local function onLevelSelected(event)
if (x~=nil and y~=nil) then
if ( (x<300) and  (y<460)) then
    clicked = 1--clicked + 1
    if (clicked ==1) then
        Runtime:removeEventListener("levelClicked")
        --levelGroup:cleanUp() MESSO TRA I COMMENTI PER FAR FUNZIONARE IL BACKTOMENU
        --print (clicked, "clicked level", livelloA)
        timer.performWithDelay(0,  runLevel(livelloA) ,1)
    end
end end --nuovo end messo qui
end
Runtime:addEventListener("levelClicked", function() timer.performWithDelay(100,onLevelSelected) end)
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
 levelGroup2 = nil
    end

end


-- destroy()
function scene:destroy( event )
print ("Arcadeee destroyed")

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
