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
    --    print( event.target.text )
        if testo ~= nil then
            sceneGroup2:remove(testo)
            testo:removeSelf()
            testo= nil
        end
        nome= string.sub(event.target.text,0,20)
        testo=display.newText(nome, display.actualContentWidth/2, display.actualContentHeight/2,native.systemFontBold, 10)
        sceneGroup2:insert(testo)
    end
end
-- create()


  function creaNumeroMusica(valore,gruppo,scorrere)
    ny = 30+(30 * (valore) + (valore*20))
      --print ("valore M:" .. valore )
      local num1,num2
      local char1=valore:sub(0,1)
      local char2= valore:sub(2,2)
    --  print (char1)
    --  print (char2)
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
  scorrere = display.newGroup()
  bg = display.newImage( composer.imgDir .. "toplivello9.jpg", 160,240 )
   bg.width=320
   bg.height=480
    sceneGroup = self.view
    sceneGroup:insert(bg)
    bg:toBack()

    local function backClicked(event)
 Runtime:removeEventListener( "touch", startDrag)
 Runtime:removeEventListener("enterFrame", limit)
        print("back clicked")
        local channel2= audio.findFreeChannel(2)
      audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
      audio.play(tapSound,{channel= channel2})
      local options = { effect = "crossFade", time = 200}
          composer.gotoScene("menu",options)
scorrere:removeSelf()
 back:removeSelf()


      end







    back= display.newImage(composer.imgDir .. "back.png",296, 461)
    back.width = 41
    back.height = 31.5
    --back.xScale=0.205
    -- back.yScale= 0.1575

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
    creaNumeroMusica(tostring(i),scorrere,sceneGroup)
    rectNome[i] = display.newImage("images/rect stats.png", nx, ex20+(30 * (i) + (i*20)) )
    testoNome[i]=display.newText("pippo franco", nx, ex20+(30 * (i) + (i*20)),native.systemFontBold, 10)
    rectNome[i].height=220
    rectNome[i].width=290

    rectPunti[i] = display.newImage("images/rect stats.png", px, ex20+(30 * (i) + (i*20)) )
    testoPunti[i]=display.newText("456",px, ex20+(30 * (i) + (i*20)),native.systemFontBold, 10)
    rectPunti[i].height=220
    rectPunti[i].width=290

    scorrere:insert(rectNome[i])
    scorrere:insert(rectPunti[i])
    --sceneGroup:insert(rectNumeri[i])

    scorrere:insert(name)
    scorrere:insert(scoreTable)


    scorrere:insert(testoNome[i])
    scorrere:insert(testoPunti[i])


    end
    local function startDrag( event )
             gr = scorrere
             local phase = event.phase


     if "began" == phase then
     -- Store initial position
    x0 = event.x
    y0 = event.y
    --ballx0 = sceneGroup.x
    bally0 = gr.y
     print("valore x= "..gr.x.."valore y= "..gr.y)
     -- Stop current motion, if any

   elseif ( bally0~=nil ) then

       print("valore x= "..gr.x.."valore y= "..gr.y)
              gr.y = bally0 + event.y - y0
          end       -- Stop further propagation of touch event!
                   return true
      end
      local function limit()

        object = scorrere
           local x = object.x
           local y = object.y
  if y~=nil then
           if(y > 0) then
                object.y = 0
           elseif(y < -99999999999999990) then
                object.y = 0
           end

end
      end
      Runtime:addEventListener("enterFrame", limit)

        local function startDrag3( event )
            local t = event.target

            local phase = event.phase
            if "began" == phase then
                -- Make target the top-most object
                local parent = t.parent
                parent:insert( t )
                display.getCurrentStage():setFocus( t, event.id )

                t.isFocus = true

                -- Store initial touch position on the actual object - prevents jumping when touched
                t.xStart = event.x - t.x
                t.yStart = event.y - t.y
            elseif t.isFocus then
                if "moved" == phase then
                    print(t.xStart)
                        t.x = event.x - t.xStart
                        if (t.x < xMin) then t.x = xMin end
                        if (t.x > xMax) then t.x = xMax end

                    --t.y = event.y - t.yStart

                elseif "ended" == phase or "cancelled" == phase then
                    display.getCurrentStage():setFocus( t, nil )
                    t.isFocus = false

                end
            end
            --This tells the system that the event
            -- should not be propagated to listeners of any objects underneath.
            return true
        end

          scorrere:addEventListener( "touch", startDrag)








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
