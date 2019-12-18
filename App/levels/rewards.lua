local composer = require( "composer" )
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
local scene = composer.newScene()
local primaEstrazione
local secondaEstrazione
local terzaEstrazione

math.randomseed(os.time())
math.random(); math.random(); math.random()


local uno
local due
local tre
local quattro
local cinque
local slot
local up
local down
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 local function animazioneValori()
    local valori = {uno,due, tre, quattro, cinque}

local function mySpriteListener( event )

end


    --scelgo l'animazione giusta in base a se sia uscito up o down
    if secondaEstrazione == 1 then 
        uno:setSequence( "1-" )
        due:setSequence( "2-" )
        tre:setSequence( "3-" )
        quattro:setSequence( "4-" )
        cinque:setSequence( "5-" )
    else
        uno:setSequence( "1+" )
        due:setSequence( "2+" )
        tre:setSequence( "3+" )
        quattro:setSequence( "4+" )
        cinque:setSequence( "5+" )
    end
    uno:addEventListener( "sprite", mySpriteListener )
    due:addEventListener( "sprite", mySpriteListener )
    tre:addEventListener( "sprite", mySpriteListener )
    quattro:addEventListener( "sprite", mySpriteListener )
    cinque:addEventListener( "sprite", mySpriteListener )


 end




 local function animazioneUpDown()
    local counter = 0
    down:setSequence( "selected" )
    up:setSequence("selected")

local function mySpriteListener( event )
    
    if ( event.phase == "ended" ) then
    if counter == 3 then
        down:removeEventListener( "sprite", mySpriteListener )
        up:removeEventListener( "sprite", mySpriteListener )
        down:setSequence( "choosed" )
        up:setSequence("choosed")
        if secondaEstrazione == 1 then 
            down:play()
        else
            up:play()
        end
        animazioneValori()
    else
    print("target "..event.target.name .. "*****")
    if event.target.name == "downSheet_0" then 
    up:play()
    counter= counter + 1
    else 
        down:play()
end

end --end if counter 
end --end if phase
end -- end listener

down:addEventListener( "sprite", mySpriteListener )
up:addEventListener( "sprite", mySpriteListener )
down:play()
end 




   function animazioneSlot()

        local decremento= 0
        local i=0

     slot:setSequence( "roll" )

    local function mySpriteListener( event )
        if event.phase == "next" then 
            if  i >= 10 then
            slot:pause()
            slot:setFrame(primaEstrazione)
            slot:removeEventListener( "sprite", mySpriteListener )
            timer.performWithDelay(100, function() animazioneUpDown()end)
            end 
        end
         if ( event.phase == "ended" ) then
         i= i +1 
             if  i >= 11 then
                slot:removeEventListener( "sprite", mySpriteListener )
                slot:setFrame(primaEstrazione)
            end
            --  slot:pause()
    slot.timeScale = 1 - decremento
    slot:play()
    decremento= decremento + 0.1
    end
    end

   slot:addEventListener( "sprite", mySpriteListener )
   timer.performWithDelay(1000 , function() slot:play() end)
end




-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    myLevel= LD_Loader:new(sceneGroup)
    myLevel:loadLevel("slot")

    primaEstrazione = math.random(1, 7)
    secondaEstrazione = math.random(1,2)
    terzaEstrazione = math.random(1,30) -- 1-12 +1  13-19 +2  20-25 +3  26-29 +4  30 = +5
    print("prima estrazione".. primaEstrazione)
    print("seconda estrazione".. secondaEstrazione)
    print("terza estrazione".. terzaEstrazione)

    uno= myLevel:getLayerObject("Layer 1", "1Sheet_0").view
    due=myLevel:getLayerObject("Layer 1", "2Sheet_0").view
    tre=myLevel:getLayerObject("Layer 1", "3Sheet_0").view
    quattro=myLevel:getLayerObject("Layer 1", "4Sheet_0").view
    cinque=myLevel:getLayerObject("Layer 1", "5Sheet_0").view
    slot = myLevel:getLayerObject("Layer 1", "statSheet_0").view
    up =myLevel:getLayerObject("Layer 1", "upSheet_0").view
    down = myLevel:getLayerObject("Layer 1", "downSheet_0").view
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase

      
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 animazioneSlot()
 --animazioneUpDown()



    end

end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
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