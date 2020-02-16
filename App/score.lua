local composer = require( "composer" )
local json = require ("json")
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

 local nome
 local testo
 local sceneGroup


--recupera valori+**+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 local sqlite3 = require ("sqlite3")
   local myNewData
   local decodedData

   local SaveData = function ()
--save new data to a sqlite file
-- open SQLite database, if it doesn't exist, create database
   local path = system.pathForFile("scores.sqlite", system.DocumentsDirectory)
   db = sqlite3.open( path )
   print(path)

-- setup the table if it doesn't exist
    local tablesetup = "CREATE TABLE Scores (User_id INTEGER PRIMARY KEY, Nick_user, Score);"
    db:exec( tablesetup )
    print(tablesetup)

-- save  data to database
   local counter = 1
   local index = "score"..counter
   local score = decodedData[counter]
   print(score)

   while (score ~=nil) do
    local tablefill ="INSERT INTO Scores VALUES ('" .. score[1] .. "','" .. score[2] .. "','" .. score[3] .."');"
    print(tablefill)
    db:exec( tablefill )
    counter=counter+1
        index = "score"..counter
        score = decodedData[counter]
   end
-- Everything is saved to SQLite database; close database
   db:close()

--Load database contents to screen
-- open database
   local path = system.pathForFile("scores.sqlite", system.DocumentsDirectory)
   db = sqlite3.open( path )
   print(path)

--print all the table contents

   local sql = "SELECT * FROM Scores ORDER BY Score DESC"
   local c= 1
   for row in db:nrows(sql) do
    local text = row.User_id.." "..row.Nick_user.." "..row.Score
    local t = display.newText(text, display.contentWidth/2, 30 * c, native.systemFont, 24)

    t:setFillColor(1,1,1)
    c= c+1
   end

   db:close()
end

local function networkListener( event )
        if ( event.isError ) then
                print( "Network error!")
                network.request( "http://192.168.1.6/scores.php", "GET", networkListener )
        else
                myNewData = event.response
               print ("From server: "..myNewData)
                decodedData = json.decode(myNewData)
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

       SaveData()

       --id dispositivo system.getInfo("deviceID")
        end
end

function ciccio(event)
    print("fatto insert")
end
--network.request( "http://192.168.1.2/scores.php", "GET", networkListener )

network.request( "http://192.168.1.2/save.php?id=34&nick=lollo&score=1111111111", "GET", ciccio )

--recupera valori+**+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



























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
        testo=display.newText(nome, display.actualContentWidth/2, display.actualContentHeight/2,native.systemFontBold, 10)
        sceneGroup:insert(testo)
    end
end
-- create()


  function creaNumeroMusica(valore,gruppo,scorrere)
    ny = 30+(30 * (valore) + (valore*20))
      print ("valore M:" .. valore )
      local num1,num2
      local char1=valore:sub(0,1)
      local char2= valore:sub(2,2)
      print (char1)
      print (char2)
  if char2 == "" then
      num1=  display.newImage(composer.imgDir .. char1 .. ".png" ,30 ,ny)
      num2=nil
      --print("case1")
  else
       --print("case2")
      num1=  display.newImage(composer.imgDir .. char1 .. ".png" ,30 - 11 ,ny)
      num2= display.newImage(composer.imgDir .. char2 .. ".png" ,30 + 11 ,ny)
      num2.width=45
      num2.height= 45
  end
  num1.width=45
  num1.height= 45
  testoVolumeMusica={fn=num1,sn=num2}
  gruppo:insert(num1)

  if num2~=nil then gruppo:insert(num2)  end
  end




function scene:create( event )

    sceneGroup = self.view

    local function backClicked(event)

        print("back clicked")
        local channel2= audio.findFreeChannel(2)
      audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
      audio.play(tapSound,{channel= channel2})
      local options = { effect = "crossFade", time = 200}
          composer.gotoScene("menu",options)
 name:removeSelf()
 scoreTable:removeSelf()
 back:removeSelf()

      end


scorrere = display.newGroup()

    back= display.newImage(composer.imgDir .. "back.png",296, 461)
    back.width = 41
    back.height = 31.5
    --back.xScale=0.205
    -- back.yScale= 0.1575
    sceneGroup:insert(back)
    back:addEventListener("tap", backClicked)

    _G.rectNome = {}
    rectPunti = {}
    rectNumeri = {}
    testoNome = {}
    testoPunti = {}
    xs=0.3
    nx=120
    px=250
    ex20= 30
    name = display.newImage("images/name.png", nx, ex20 ) name:scale( xs, xs ) name.height=350
    scoreTable = display.newImage("images/scoreTable.png", px, ex20 ) scoreTable:scale( xs, xs )
    for i=1, 99 do
    --rectNumeri[i] = display.newImage("images/"..i..".png", 30, ex20+(30 * (i) + (i*20)) )
     --rectNumeri[i]:scale(xs,xs)
    creaNumeroMusica(tostring(i),sceneGroup,scorrere)
    rectNome[i] = display.newImage("images/rect stats.png", nx, ex20+(30 * (i) + (i*20)) )
    testoNome[i]=display.newText("pippo franco", nx, ex20+(30 * (i) + (i*20)),native.systemFontBold, 10)
    rectNome[i].height=220
    rectNome[i].width=290

    rectPunti[i] = display.newImage("images/rect stats.png", px, ex20+(30 * (i) + (i*20)) )
    testoPunti[i]=display.newText("456",px, ex20+(30 * (i) + (i*20)),native.systemFontBold, 10)
    rectPunti[i].height=220
    rectPunti[i].width=290

    sceneGroup:insert(rectNome[i])
    sceneGroup:insert(rectPunti[i])
    --sceneGroup:insert(rectNumeri[i])
    scorrere:insert(name)
    scorrere:insert(scoreTable)
    scorrere:insert(back)
    sceneGroup:insert(testoNome[i])
    sceneGroup:insert(testoPunti[i])



    end

    local function startDrag( event )
      gr = sceneGroup
                     local phase = event.phase
     if "began" == phase then
     -- Store initial position
    x0 = event.x
    y0 = event.y
    --ballx0 = sceneGroup.x
    bally0 = gr.y
     print(x0, y0)
     -- Stop current motion, if any
          elseif "moved" == phase or "ended" == phase or "cancelled" == phase then
                      --  sceneGroup.x = ballx0 + event.x - x0
                        gr.y = bally0 + event.y - y0
          end                -- Stop further propagation of touch event!
                   return true
                 end
        Runtime:addEventListener( "touch", startDrag)









    -- Code here runs when the scene is first created but has not yet appeared on screen
    --[[

    rectPunti = {}
    for i=1,10 do
    rectNome[i] = display.newImage("images/rect stats.png", 50, 30 * (i) + (i*20) )
    testo=display.newText("pippo franco", 50, 30 * (i) + (i*20),native.systemFontBold, 10)
    rectNome[i].height=220
    rectNome[i].width=250
    rectPunti[i] = display.newImage("images/rect stats.png", 250, 30 * (i) + (i*20) )
    testo=display.newText("456", 150, 30 * (i) + (i*20),native.systemFontBold, 10)
    rectPunti[i].height=220
    rectPunti[i].width=250
    end

 local nameField = native.newTextField( 150, 300, 220, 36 )
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
sceneGroup:insert(nameField)]]
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
