local composer = require( "composer" )
local json = require ("json")
require ("lib.partitaStoria")
require("lib.LD_LoaderX")
local preference = require "lib.preference"
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 local _W= display.actualContentWidth/2
 local _H= display.actualContentHeight/2
 local nome
 local sfondo
 local text
 local crimson
 local cottonBall
 local cornice
 local tries
 local sceneGroup
 local nameField
 local id= system.getInfo("deviceID")
 local score= partitaS:score()
 if ( score=="gianna" or score==nil )then 
  score=0 
end 
 local ipV4= "http://192.168.1.47:8080"
 local loading 


local function  cancellazioneEnnupla(event)
  if ( event.isError or tries > 10) then
                print( "Network error!")
                tries = tries + 1
                if tries <= 10 then
                  network.request( ipV4.."/cancellaEnnupla.php?id="..string.format(id), "GET", cancellazioneEnnupla )
                else
                  composer.gotoScene("menu", { effect = "crossFade", time = 200})
                end
        else
          tries = 0
          myNewData = event.response
          print( myNewData )
          inserisciValori()
        end
end


local function networkListener( event )
        if ( event.isError or  tries > 10) then
                print( "Network error!")
                print( event.response )
                tries = tries + 1
                if tries <= 10 then 
                network.request( ipV4.."/getValoremax.php?id="..string.format(id), "GET", networkListener )
              else
                composer.gotoScene("menu", { effect = "crossFade", time = 200})
              end
        else
          tries= 0
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
  network.request( ipV4.."/cancellaEnnupla.php?id="..string.format(id), "GET", cancellazioneEnnupla )
 else
  print( "valore minore uguale allo score massimo che hai raggiunto" )

 -- if (nameField ~= nil) then 
 -- nameField:removeSelf()
--end
  composer.gotoScene("menu", { effect = "crossFade", time = 200})
 end

 end
 end
end

function getValoreMAX()
network.request( ipV4.."/getValoremax.php?id="..string.format(id), "GET", networkListener )
end

function ciccio(event)
   if ( event.isError or tries > 10) then
                print( "Network error!")
                tries = tries + 1
                if tries <= 10 then 
                network.request( ipV4.."/save.php?id="..string.format(id).."&nick="..string.format(nome).."&score="..string.format(score), "GET", ciccio )
              else
                composer.gotoScene("menu", { effect = "crossFade", time = 200})
              end
        else
    print("fatto insert")
    nameField:removeSelf()
   composer.gotoScene("menu", { effect = "crossFade", time = 200})
 end
end

function inserisciValori()
print( id )
print( nome )
print( score )
network.request( ipV4.."/save.php?id="..string.format(id).."&nick="..string.format(nome).."&score="..string.format(score), "GET", ciccio )
end


function versoDestra()
  if (cottonball~=nil) then 
  transition.to( cottonball, { time=3000, x= 280, onComplete=versoSinistra} )
end
end 



function versoSinistra()
  if (cottonball~=nil) then 
  transition.to( cottonball, { time=3000, x=40, onComplete=versoDestra} )
end
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
        nome= string.sub(event.target.text,0,12)
        getValoreMAX()
        loading.alpha=1
        loading:play()
    end
end
-- create()
function scene:create( event )
 native.setProperty( "androidSystemUiVisibility", "default" )
 
    sceneGroup = self.view
sfondo= display.newImage(composer.imgDir.."sfondoSenzaTorre.png",_W, _H)
sfondo.xScale= 0.6
sfondo.height= 480

if preference.getValue("pg")=="crimson" then 
  print( "crimson" )
    local options= {
      width= 702,
      height= 502,
      numFrames= 12,
      sheetContenteWidth= 2808,
      sheetContenteHeight= 1506
    }

    local sheetCrimson = graphics.newImageSheet(composer.imgDir.."crimsonBreath.png", options)

    local sequenceData = {
      name = "crimson", start= 1, count= 12, time = 1000, loopCount= 0
    }
    crimson = display.newSprite (sheetCrimson, sequenceData)
    crimson.x= _W
    crimson.y= 286
    crimson.alpha=1
    crimson.xScale = 0.22
    crimson.yScale = 0.22
    crimson:play()
    sceneGroup:insert(crimson)
else
print( "cottonBall" )
  myLevel= LD_Loader:new(sceneGroup)
  myLevel:loadLevel("personaggi.cottonBall")

  cottonball= myLevel:getLayerObject("Layer 1", "cottonBall" ).view
  cottonball:play()
  cottonball.x= 40
  cottonball.y= 216 -- -90
  sceneGroup:insert(cottonball)
  versoDestra()
end 

    -- Code here runs when the scene is first created but has not yet appeared on screen
nameField = native.newTextField( 160, 260, 250, 36 )
nameField.inputType = "default"
--nameField.text = "Hello World!"
nameField.font = native.newFont( native.systemFontBold, 18 )
nameField.size = 18
nameField:resizeHeightToFitFont()
nameField.placeholder = "Tap to insert (Max 12 characters)"
nameField.align = "center"
nameField.hasBackground = true
nameField.spellCheckingType = "UITextSpellCheckingTypeNo"
nameField.autocorrectionType = "UITextAutocorrectionTypeNo"
nameField:resizeHeightToFitFont()
nameField:setTextColor(1,0.2,0.1,1)
nameField:addEventListener( "userInput", textListener )

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
    loading.x= 295
    loading.y= 455
    loading.xScale = 0.2
    loading.yScale = 0.2
    loading.alpha= 0

   -- explosion:addEventListener( "sprite", function(event) print(event.phase) if (event.phase == "ended") then print("lalalla") explosion:removeSelf() explosion=nil end end )
    

cornice=  display.newImage(composer.imgDir.."corniceScore.png",160, 260)
cornice.height= 30
cornice.width= 258
text= display.newImage(composer.imgDir.."schermataFinale.png",_W, _H)
text.height= text.height/2
text.width= text.width/2
sceneGroup:insert(sfondo)
sceneGroup:insert(cornice)
sceneGroup:insert(loading)
sceneGroup:insert(nameField)
sceneGroup:insert(text)
cornice:toBack()
sfondo:toBack()

tries= 0
end
 
 
-- show()
function scene:show( event )
 
    sceneGroup = self.view
    local phase = event.phase
    
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