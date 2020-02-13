local composer = require( "composer" )
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
local scene = composer.newScene()
local primaEstrazione
local secondaEstrazione
local terzaEstrazione
suonoSlot= audio.loadSound("sounds/slot.mp3")
posSlot= audio.loadSound("sounds/posSlot.mp3")
negSlot= audio.loadSound("sounds/negSlot.mp3")
local preference = require "lib.preference"
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
local statistiche= {"danno","numeroPalle", "velocita", "rimbalzo", "grandezza", "densita", "fortuna"}
local fortuna = preference.getValue("statsT") .fortuna


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 local function animazioneValori()
    local valori = {uno,due, tre, quattro, cinque}
    local counter = 2

local function mySpriteListener( event )
    if ( event.phase == "ended" ) then
        if counter == 6 then
            cinque:removeEventListener( "sprite", mySpriteListener )
            valori[terzaEstrazione]:setFrame(2)
        else
        valori[counter]:play()
        valori[counter - 1]:removeEventListener( "sprite", mySpriteListener )
        counter= counter + 1 
    end 
    end 
    
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
    uno:play()

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
         timer.performWithDelay(500, function()
   animazioneValori()
    end)
        
    else
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
   timer.performWithDelay(200 , function() slot:play() end)
end

function elaboraEstrazioneDopoUp(valore)
    if (valore >= 30 - fortuna) then   --questa struttura così dopo sommo la fortuna a questi valore
        terzaEstrazione=5
    elseif ((valore >= 26 - fortuna) and (valore <= 29)) then
        terzaEstrazione=4
    elseif ((valore >= 20 -fortuna) and (valore <= 25)) then 
        terzaEstrazione=3
    elseif ((valore >= 13 - fortuna) and (valore <=19)) then 
        terzaEstrazione=2
    elseif  ((valore>= 1) and (valore<=12))then 
         terzaEstrazione= 1 
    end
    print (terzaEstrazione)
end 


function elaboraEstrazioneDopoDown(valore)
    if ((valore>= 1) and (valore<= 12 + fortuna)) then   --questa struttura così dopo sommo la fortuna a questi valore
        terzaEstrazione= 1
    elseif ((valore >= 13) and (valore <=19 + fortuna)) then 
        terzaEstrazione=2
    elseif ((valore >= 20) and (valore <= 25 + fortuna)) then 
        terzaEstrazione=3
    elseif ((valore >= 26) and (valore <= 29 + fortuna)) then
        terzaEstrazione=4
    elseif (valore >= 30 + fortuna)  then  --quindi giaà con luch ad 1 il -5 non può capitare
        terzaEstrazione=5
    end
    print (terzaEstrazione)
end 


function correggiStat()
   if statistiche[primaEstrazione]== "danno" then 
    if partitaS:stats()[statistiche[primaEstrazione]] <= 0 then 
        partitaS:stats()[statistiche[primaEstrazione]] = 1
    end

   elseif statistiche[primaEstrazione]== "numeroPalle" then 
    if partitaS:stats()[statistiche[primaEstrazione]] < 2 then
        partitaS:stats()[statistiche[primaEstrazione]] = 2
    end
    if partitaS:stats()[statistiche[primaEstrazione]] > 12 then
        partitaS:stats()[statistiche[primaEstrazione]] = 12
    end

   elseif statistiche[primaEstrazione]== "velocita" then 
       if partitaS:stats()[statistiche[primaEstrazione]] <= 0 then 
        partitaS:stats()[statistiche[primaEstrazione]] = 1
    end

   elseif statistiche[primaEstrazione]== "rimbalzo" then
    if partitaS:stats()[statistiche[primaEstrazione]] <= 20 then 
        partitaS:stats()[statistiche[primaEstrazione]] = 20
    end
    if partitaS:stats()[statistiche[primaEstrazione]] > 95 then 
        partitaS:stats()[statistiche[primaEstrazione]] = 95
    end

   elseif statistiche[primaEstrazione]== "grandezza" then
       if partitaS:stats()[statistiche[primaEstrazione]] <= 2 then
           partitaS:stats()[statistiche[primaEstrazione]] = 2
       end
       if partitaS:stats()[statistiche[primaEstrazione]] >= 25 then
           partitaS:stats()[statistiche[primaEstrazione]] = 25
       end

   elseif statistiche[primaEstrazione]== "densita" then 
    if partitaS:stats()[statistiche[primaEstrazione]] <= 0 then
        partitaS:stats()[statistiche[primaEstrazione]] = 0
    end

elseif statistiche[primaEstrazione]== "fortuna" then 
    if partitaS:stats()[statistiche[primaEstrazione]] <= 0 then
        partitaS:stats()[statistiche[primaEstrazione]] = 0
    end
end
end


function modificaStatistiche()

    if secondaEstrazione == 1 then 
        partitaS:stats()[statistiche[primaEstrazione]]= partitaS:stats()[statistiche[primaEstrazione]] - terzaEstrazione
        print (statistiche[primaEstrazione].. " - " .. terzaEstrazione)
    else
        partitaS:stats()[statistiche[primaEstrazione]]= partitaS:stats()[statistiche[primaEstrazione]] + terzaEstrazione
        print (statistiche[primaEstrazione].. " + " .. terzaEstrazione)
    end
end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local background = display.newImage(composer.imgDir .. "bgRewards.jpg", 0, 0, true)
    background.anchorX = 0
    background.anchorY = 0
    sceneGroup:insert(background)
    myLevel= LD_Loader:new(sceneGroup)
    myLevel:loadLevel("slot")

    primaEstrazione = math.random(1, 7)
    secondaEstrazione =  math.random(1,3 + fortuna)
    terzoValore = math.random(1,30) -- 1-12 +1  13-19 +2  20-25 +3  26-29 +4  30 = +5
    print("prima estrazione".. primaEstrazione)
    print("seconda estrazione".. secondaEstrazione) -- 1 = -
    print("valore per la terza estrazione".. terzoValore)
    if secondaEstrazione == 1 then 
        elaboraEstrazioneDopoDown(terzoValore)
    else
    elaboraEstrazioneDopoUp(terzoValore)
    end 
    

    uno= myLevel:getLayerObject("Layer 1", "1Sheet_0").view
    due=myLevel:getLayerObject("Layer 1", "2Sheet_0").view
    tre=myLevel:getLayerObject("Layer 1", "3Sheet_0").view
    quattro=myLevel:getLayerObject("Layer 1", "4Sheet_0").view
    cinque=myLevel:getLayerObject("Layer 1", "5Sheet_0").view
    slot = myLevel:getLayerObject("Layer 1", "statSheet_0").view
    up =myLevel:getLayerObject("Layer 1", "upSheet_0").view
    down = myLevel:getLayerObject("Layer 1", "downSheet_0").view

    
    print ("statistiche*******prima di rolling************")
    print (partitaS:stats().danno)
    print (partitaS:stats().numeroPalle)
    print(partitaS:stats().velocita)
    print (partitaS:stats().rimbalzo)
    print (partitaS:stats().grandezza)
    print  (partitaS:stats().densita)
    print  (partitaS:stats().fortuna)

    modificaStatistiche()
    correggiStat()
    preference.save{statsT= partitaS:stats()}

    print ("luck attiva per il roll: " .. fortuna)

   
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase

      
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
    local channel1= audio.findFreeChannel(1)
  audio.setVolume( partitaS:volumeMusica(), {channel=channel1}  )
  audio.play(suonoSlot,{channel= channel1})

    animazioneSlot()

    local isChannel1Active = audio.isChannelActive( 1 )
    function attivaEffettoSonoro()
if isChannel1Active then
    audio.stop( 1 )
 end
 local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
    if secondaEstrazione > 1 then 
  audio.play(posSlot,{channel= channel2})
else  
audio.play(negSlot,{channel= channel2})
end 
end
timer.performWithDelay(8500,attivaEffettoSonoro)

    timer.performWithDelay(12000, function()
   composer.gotoScene("levels.mappa")
    end)


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