local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 local nome
 local testo
 local sceneGroup



 local sqlite3 = require ("sqlite3")
   local myNewData 
   local json = require ("json")
   local decodedData 

   local SaveData = function ()
--save new data to a sqlite file
-- open SQLite database, if it doesn't exist, create database
   local path = system.pathForFile("movies.sqlite", system.DocumentsDirectory)
   db = sqlite3.open( path ) 
   print(path)
            
-- setup the table if it doesn't exist
    local tablesetup = "CREATE TABLE IF NOT EXISTS mymovies (id INTEGER PRIMARY KEY, movie, year);"
    db:exec( tablesetup )
    print(tablesetup)
        
-- save  data to database
   local counter = 1
   local index = "movie"..counter
   local movie = decodedData[index]
   print(movie)

   while (movie ~=nil) do
    local tablefill ="INSERT INTO mymovies VALUES (NULL,'" .. movie[2] .. "','" .. movie[3] .."');"
    print(tablefill)
    db:exec( tablefill )
    counter=counter+1
        index = "movie"..counter
        movie = decodedData[index]
   end          
-- Everything is saved to SQLite database; close database
   db:close()
            
--Load database contents to screen
-- open database    
   local path = system.pathForFile("movies.sqlite", system.DocumentsDirectory)
   db = sqlite3.open( path ) 
   print(path)
        
--print all the table contents
   local sql = "SELECT * FROM mymovies"
   for row in db:nrows(sql) do
    local text = row.movie.." "..row.year
    local t = display.newText(text, display.contentWidth/2, 30 * row.id, native.systemFont, 24)
    t:setFillColor(1,1,1)
   end  
    
   db:close()
end

local function networkListener( event )
        if ( event.isError ) then
                print( "Network error!")
        else
                myNewData = event.response
               print ("From server: "..myNewData)
                decodedData = (json.decode( myNewData))

--local myText= display.newText(decodedData.movie1[2], 50,50, nil,24)
--myText:setTextColor(1,1,1)
      --  SaveData()
        end
end

network.request( "https://www.db4free.net/phpMyAdmin/sql.php?server=1&db=giannadb&table=Scores&pos=0/scores.php", "GET", networkListener )
























 
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
function scene:create( event )
 
    sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 local nameField = native.newTextField( 150, 150, 220, 36 )
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