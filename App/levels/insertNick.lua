local composer = require( "composer" )
local json = require ("json")
require ("lib.partitaStoria")
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 local nome
 local testo
 local sceneGroup
 local nameField
 local id= system.getInfo("deviceID")
 local score= partitaS:score()


local function  cancellazioneEnnupla(event)
  if ( event.isError ) then
                print( "Network error!")
                  network.request( "http://192.168.1.2/cancellaEnnupla.php?id="..string.format(id), "GET", cancellazioneEnnupla )
        else
          myNewData = event.response
          print( myNewData )
          inserisciValori()
        end
end


local function networkListener( event )
        if ( event.isError ) then
                print( "Network error!")
                network.request( "http://192.168.1.2/getValoremax.php?id="..string.format(id), "GET", networkListener )
        else
                myNewData = event.response
                if myNewData == "" then 
                print( "nulla" )
                inserisciValori()
              else
               print ("From server: "..myNewData)
                decodedData = json.decode(myNewData)
                print( decodedData[1])
                print( decodedData[2])
                print( decodedData[3])
               
-- From server: Total results: 2[["450546","Gianna","66666666"],["45678433","Philips","456"]]
--  From server: [["450546","Gianna","66666666"],["45678433","Philips","456"]]
--[[
20:34:58.042  1 table: 17AB8288
20:34:58.042  1 450546
20:34:58.042  2 Gianna
20:34:58.042  3 66666666
20:34:58.042  2 table: 17AB80D0
20:34:58.042  1 45678433
20:34:58.042  2 Philips
20:34:58.042  3 456 ]]-- 
--print (decodedData)
--for i,v in ipairs( decodedData ) do print( i,v )
 --for m,n in ipairs( v ) do print( m,n )
 --end
 --end 
print("scoreeee" )
print( score )
 if tonumber(decodedData[3]) < score then 
  print( "cancellazione" )
  network.request( "http://192.168.1.2/cancellaEnnupla.php?id="..string.format(id), "GET", cancellazioneEnnupla )
 end

 end
 end
end

function getValoreMAX()
network.request( "http://192.168.1.2/getValoremax.php?id="..string.format(id), "GET", networkListener )
end

function ciccio(event)
    print("fatto insert")
    nameField:removeSelf()
   composer.gotoScene("menu", { effect = "crossFade", time = 200})
end

function inserisciValori()
print( id )
print( nome )
print( score )
network.request( "http://192.168.1.2/save.php?id="..string.format(id).."&nick="..string.format(nome).."&score="..string.format(score), "GET", ciccio )
end

























 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local function textListener( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        print( event.target.text )
        if testo ~= nil then 
            sceneGroup:remove(testo)
            testo:removeSelf()
            testo= nil 
        end
        nome= string.sub(event.target.text,0,20)
        getValoreMAX()
        --inserisciValori(nome)
        testo=display.newText(nome, display.actualContentWidth/2, display.actualContentHeight/2,native.systemFontBold, 10)
        sceneGroup:insert(testo)
    end
end
-- create()
function scene:create( event )
 
    sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
nameField = native.newTextField( 150, 300, 220, 36 )
nameField.inputType = "default"
--nameField.text = "Hello World!"
nameField.font = native.newFont( native.systemFontBold, 18 )
nameField.size = 18
nameField:resizeHeightToFitFont()
nameField.placeholder = "(Insert you nickname)"
nameField.align = "center"
nameField.hasBackground = false
nameField.spellCheckingType = "UITextSpellCheckingTypeNo"
nameField.autocorrectionType = "UITextAutocorrectionTypeNo"
nameField:resizeHeightToFitFont()
nameField:setTextColor(1,0.2,0.1,1)
nameField:addEventListener( "userInput", textListener )
sceneGroup:insert(nameField)
end
 
 
-- show()
function scene:show( event )
 
    sceneGroup = self.view
    local phase = event.phase

       -- testo = display.newText("crediti", display.actualContentWidth/2, display.actualContentHeight/2,native.systemFontBold, 30)
    

    
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        if nil~= composer.getScene("toOptions") then composer.removeScene("toOptions", false) end
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    sceneGroup = self.view
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