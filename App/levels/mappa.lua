local composer = require( "composer" )
require ("lib.partitaStoria")
local preference = require "lib.preference"
local scene = composer.newScene()
local _w = display.contentWidth/2
local _h = display.contentHeight/2
ladderSound= audio.loadStream("sounds/cambio_piano.mp3")
openMappa= audio.loadSound("sounds/scroll.mp3")
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 local p1, p2, p3
 local torre


 local stanzaSelezionata
 local sceneGroup

 lista= {}  --lista delle stanze da creare
 listaRect={}  --lista grafica delle stanze 
 listaPorte={}  --lista grafica delle porte, da levare? 
 local gruppo_schermata = display.newGroup()

 local testoPiano
 local background
 local testoSchermata
 local attivaEffettoMappa= true
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local function onButtonClickStanzaSelezionata(event)
    local options =  { effect = "crossFade",
     time = 200,
     params = {modalita= "tower"}
 }
 stanza= event.target.stanza
-- if (stanza.nome=="scene1" or stanza.nome=="scene2" or stanza.nome=="scene5" or stanza.nome=="scene6" or stanza.nome=="scene9" or
--  stanza.nome=="scene3" or stanza.nome=="scene4" or stanza.nome=="scene11" or stanza.nome=="scene12" or stanza.nome=="scene13" or
--  stanza.nome=="scene15" or stanza.nome=="scene17" or stanza.nome=="scene19" or stanza.nome=="scene22" or stanza.nome=="scene23" or
--   stanza.nome=="scene25" or stanza.nome=="scene27") then 
--  composer.gotoScene("levels."..stanza.nome, options)
--else
    composer.gotoScene("levels.scene30", options)
  --end
  print( stanza.nome )
  stanzaSelezionata= stanza
end

--  stanza.isCompleted = true 
--  torre.stanzaAttuale= stanza
--            if stanza.nord ~= nil then
--                stanza.nord.isLocked= false
--            end
--            if stanza.est ~= nil then
--                stanza.est.isLocked= false
--            end
--            if stanza.sud ~= nil then
--                stanza.sud.isLocked= false
--            end
--            if stanza.ovest ~= nil then
--                stanza.ovest.isLocked= false
--            end
--           -- print("lista rect valore: ")
--           -- print (#listaRect)
--            cancellaMappa(listaRect, listaPorte)
--            lista= nil
--            lista= {}
--            creazione()


local function stanzaSuperata() 
    stanzaSelezionata.isCompleted = true 
  torre.stanzaAttuale= stanzaSelezionata
            if stanzaSelezionata.nord ~= nil then
                stanzaSelezionata.nord.isLocked= false
            end
            if stanzaSelezionata.est ~= nil then
                stanzaSelezionata.est.isLocked= false
            end
            if stanzaSelezionata.sud ~= nil then
                stanzaSelezionata.sud.isLocked= false
            end
            if stanzaSelezionata.ovest ~= nil then
                stanzaSelezionata.ovest.isLocked= false
            end
           -- print("lista rect valore: ")
           -- print (#listaRect)
            cancellaMappa(listaRect, listaPorte)
            lista= nil
            lista= {}
            creazione()

end 

local function onButtonClickStanzaSelezionataDadi(event)
      local options =  { effect = "crossFade",
     time = 200,
     params = {modalita= "tower"}
 }
    composer.gotoScene("levels.rewards", options)
  stanza= event.target.stanza
  stanza.isCompleted = true 
  torre.stanzaAttuale= stanza
            if stanza.nord ~= nil then
                stanza.nord.isLocked= false
            end
            if stanza.est ~= nil then
                stanza.est.isLocked= false
            end
            if stanza.sud ~= nil then
                stanza.sud.isLocked= false
            end
            if stanza.ovest ~= nil then
                stanza.ovest.isLocked= false
            end
           -- print("lista rect valore: ")
           -- print (#listaRect)
            cancellaMappa(listaRect, listaPorte)
            lista= nil
            lista= {}
            creazione()
end

local function onButtonClickStanzaSelezionataUscita(event)
  print("bottone finestra fine piano tappato")

torre.pianoAttuale= torre.pianoAttuale+1
      if (torre.pianoAttuale<=2) then 
        audio.setVolume( partitaS:volumeEffettoSonoro(), {channel= 2}  )
audio.play(ladderSound, {loops= 1, channel=2})
    if (torre.pianoAttuale==1) then
        testoPiano = display.newImage(composer.imgDir .. "secondoPiano.png", 0, 38, true)
        testoPiano.anchorX = 0
        testoPiano.anchorY = 0
        testoPiano.width= 320
        testoPiano.height= 25
    sceneGroup:insert(testoPiano)
    else
        testoPiano = display.newImage(composer.imgDir .. "terzoPiano.png", 0, 38, true)
        testoPiano.anchorX = 0
        testoPiano.anchorY = 0
        testoPiano.width= 320
        testoPiano.height= 25
    sceneGroup:insert(testoPiano)
  end
gruppo_schermata:removeSelf()
gruppo_schermata= display.newGroup()
creazione()
else
 -- preference.save{tower=123}
  gruppo_schermata:removeSelf()
  gruppo_schermata= display.newGroup()
  preference.save{pg="gianna"}
  composer.gotoScene("menu", { effect = "crossFade", time = 200})

    return true  --aggiungere schermata di vittoria o boss fight finale 
end
end

local function creaScore(valore,x,y)

  for i = 1, #valore do
    local c = valore:sub(i,i)
   -- print(c)
    -- do something with c
    local num = display.newImage(composer.imgDir .. c .. ".png" , (x + i*23) ,y)
    num.width= 45
    num.height= 45
    gruppo_schermata:insert(num)
  end
end 


local function creaScrittaDannoUp()

   local up= display.newImage(composer.imgDir .. "upL.png", 198, 215)
   --up.x= 130 
   -- up.y= 190
    up.width= 40
    up.height= 40
   local unoTxt= display.newImage(composer.imgDir .. 1 .. ".png", 236, 215)
   unoTxt.width= 45
   unoTxt.height= 45
   local damageTxt= display.newImage(composer.imgDir .. "damageTxt.png", 135,215)
   damageTxt.width= 220
   damageTxt.height= 38
   gruppo_schermata:insert(up)
   gruppo_schermata:insert(unoTxt)
   gruppo_schermata:insert(damageTxt)

  end 

local function vaiNuovoPiano()
   -- print("uscita selezionata")
    cancellaMappa(listaRect, listaPorte)
    lista= nil
    lista= {}
    sceneGroup:remove(testoPiano)
    testoPiano:removeSelf()
    testoPiano= nil

    myLevel= LD_Loader:new(gruppo_schermata)
  myLevel:loadLevel("finestra")
  local rectButton= myLevel:getLayerObject("Rects", "rect_1").view
  local rectScritta= myLevel:getLayerObject("Rects", "rect_2").view
  local rectScore= myLevel:getLayerObject("Rects", "rect_3").view
  --local finestra= myLevel:getLayerObject("Layer 1", "finestraFineL_0").view
 -- local scrittaScore= myLevel:getLayerObject("Layer 1", "score_0").view

  local scritta = display.newImage( composer.imgDir .. "floorCompleted.png" , rectScritta.x ,rectScritta.y + 12 )
  print("*******************************"..rectScritta.x)
  print("*******************************"..rectScritta.y + 12 )
  scritta.width= 320
  scritta.height= 40 
  local scorep
  if mod_par=="tower" then 
  scorep=partitaS:score()
else 
  scorep=partitaS:getScore(500,(os.time() - tempoInizioLivello) - tempoPausaTotale, numBallMax,true)
end 
  creaScore(tostring(scorep), (rectScore.x -30), rectScore.y)
  partitaS:stats().danno= partitaS:stats().danno + 1
  preference.save{statsT= partitaS:stats()}
  print("danno aumentato dopo aver completato il livello")
  --creaDanno
  print( "piano attuale ".. string.format(torre.pianoAttuale) )
  if(torre.pianoAttuale<2) then
  print("aiaaaiaiaiiiaaiaia") 
  creaScrittaDannoUp()
else 
  preference.save{tower=123}
  partitaS:new()
end

  

  gruppo_schermata:insert(scritta)
  gruppo_schermata:insert(rectButton)
  gruppo_schermata:insert(rectScritta)
 -- gruppo_schermata:insert(finestra)
  --gruppo_schermata:insert(scrittaScore)

  rectButton:addEventListener("tap", onButtonClickStanzaSelezionataUscita)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


local function creaMappa(stanza, iter)
  preference.save{tower=torre}
    --margine -> per distaccare le stanza
    --larghezza stanza == altezza stanza
local margine= 2
local altezza = 40
local larghezza= 40 
local rect

if(stanza==nil) then 
        return true
else

if stanza.isCompleted== true then
rect= display.newImage( composer.imgDir .."stanzaCompletata.png", _w + (stanza.coordinate.x* (larghezza + margine)), _h - (stanza.coordinate.y *(larghezza + margine)))
sceneGroup:insert(rect)
--rect.stanza= stanza
table.insert(listaRect, rect)
elseif stanza.isLocked==true then
    rect = display.newImage( composer.imgDir .."stanzaBloccata.png", _w + (stanza.coordinate.x* (larghezza + margine)), _h - (stanza.coordinate.y *(larghezza + margine)))
    sceneGroup:insert(rect)
    table.insert(listaRect, rect)
elseif stanza.tipo== "tesoro" then 
    rect = display.newImage( composer.imgDir .."stanzaPremio.png", _w + (stanza.coordinate.x* (larghezza + margine)), _h - (stanza.coordinate.y *(larghezza + margine)))
    sceneGroup:insert(rect)
    table.insert(listaRect, rect)
    rect:addEventListener("tap", onButtonClickStanzaSelezionataDadi)
elseif stanza.tipo == "uscita" then
    rect = display.newImage( composer.imgDir .."stanzaUscita.png", _w + (stanza.coordinate.x* (larghezza + margine)), _h - (stanza.coordinate.y *(larghezza + margine)))
    table.insert(listaRect, rect)
    sceneGroup:insert(rect)
    --prossimo piano se 1 o 2, vittoria se 3
    rect:addEventListener("tap", vaiNuovoPiano)
else
rect = display.newImage( composer.imgDir .."stanzaSbloccata.png", _w + (stanza.coordinate.x* (larghezza + margine)), _h - (stanza.coordinate.y *(larghezza + margine)))
table.insert(listaRect, rect)
rect:addEventListener("tap", onButtonClickStanzaSelezionata)
sceneGroup:insert(rect)
end

rect.stanza= stanza
rect.width= larghezza
rect.height= altezza

--stampa delle porte (da eliminare)
 if stanza.nord ~= nil then
 porta = display.newRect( rect.x, rect.y - ((altezza/2)+1), 4, 4)
 porta:setFillColor( 0,0,0 )
 sceneGroup:insert(porta)
 table.insert(listaPorte, porta)
 table.insert(lista,stanza.nord)
end
 if stanza.est ~= nil then
 porta = display.newRect( rect.x + ((larghezza/2)+1), rect.y , 4, 4)
 porta:setFillColor( 0,0,0 )
 sceneGroup:insert(porta)
 table.insert(listaPorte, porta)
  table.insert(lista,stanza.est)
end
 if stanza.ovest ~= nil then
 porta = display.newRect( rect.x-((larghezza/2)+1), rect.y , 4, 4)
 porta:setFillColor( 0,0,0 )
 sceneGroup:insert(porta)
 table.insert(listaPorte, porta)
  table.insert(lista,stanza.ovest)
end
 if stanza.sud ~= nil then
 porta = display.newRect( rect.x, rect.y + ((altezza/2)+1), 4, 4)
 porta:setFillColor( 0,0,0 )
 sceneGroup:insert(porta)
 table.insert(listaPorte, porta)
  table.insert(lista,stanza.sud)
end
--fine stampa delle porte

new_iter= iter +1
creaMappa(lista[new_iter], new_iter)
end
end

--funzione che cancella una mappa in uno stato passato per allegerire la memoria 
function cancellaMappa (listaRect,porte)
    for i=1, #listaRect do
        listaRect[i]:removeSelf()
        listaRect[i]= nil
    end
    for i=1, #porte do
        porte[i]:removeSelf()
        porte[i]= nil
    end
    listarect= nil
    listarect= {}
    porte={}
    porte=nil
end 



function creazione()
  
    local indicePartenza= 0
if (torre.pianoAttuale==0) then 
    creaMappa(p1.start,indicePartenza )
elseif (torre.pianoAttuale==1) then 
    creaMappa(p2.start,indicePartenza )
else
    creaMappa(p3.start,indicePartenza )
end
end





-- create()
function scene:create( event )
   print ("createeeee mappaaaaaaaaaaaaaaaaa stronzoooooooooooooooooooooooooooo")
  partitaS:new()
  torre = partitaS:torre()
   p1 = partitaS:torre().primoPiano
   p2 = partitaS:torre().secondoPiano
   p3 = partitaS:torre().terzoPiano

    sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
background = display.newImage(composer.imgDir .. "scrollBg.jpg", 0, 0, true)
    background.anchorX = 0
    background.anchorY = 0
    background.width= 320
    background.height= 480
    sceneGroup:insert(background)

testoSchermata = display.newImage(composer.imgDir .. "testoMappa.png", 0, 0, true)
testoSchermata.anchorX = 0
    testoSchermata.anchorY = 0
    testoSchermata.width= 320
    testoSchermata.height= 480
    sceneGroup:insert(testoSchermata)

if (preference.getValue("tower").pianoAttuale==0) then 
testoPiano = display.newImage(composer.imgDir .. "primoPiano.png", 0, 38, true)
elseif  (preference.getValue("tower").pianoAttuale==1) then
testoPiano = display.newImage(composer.imgDir .. "secondoPiano.png", 0, 38, true)
else
testoPiano = display.newImage(composer.imgDir .. "terzoPiano.png", 0, 38, true)
end

testoPiano.anchorX = 0
    testoPiano.anchorY = 0
    testoPiano.width= 320
    testoPiano.height= 25
    sceneGroup:insert(testoPiano)

 creazione()

end --fine create()

 
 
-- show()
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    audio.stop(1)
    if ( phase == "will" ) then

      if not (event.params==nil) then 
  print("ci sono parametri")
if event.params.livelloCompletato then 
  print ("stanzaSuperataaaaaaaaaaaaaaaaaaaaaaa")
   stanzaSuperata() 
end
end 
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        if nil~= composer.getScene("toPlay") then composer.removeScene("toPlay", false) end
      if nil~= composer.getScene("levels.scene1") then composer.removeScene("levels.scene1", false) end
      if nil~= composer.getScene("levels.scene2") then composer.removeScene("levels.scene2", false) end
      if nil~= composer.getScene("levels.scene3") then composer.removeScene("levels.scene3", false) end
      if nil~= composer.getScene("levels.scene4") then composer.removeScene("levels.scene4", false) end
      if nil~= composer.getScene("levels.scene5") then composer.removeScene("levels.scene5", false) end
      if nil~= composer.getScene("levels.scene6") then composer.removeScene("levels.scene6", false) end
      if nil~= composer.getScene("levels.scene7") then composer.removeScene("levels.scene7", false) end
      if nil~= composer.getScene("levels.scene8") then composer.removeScene("levels.scene8", false) end
      if nil~= composer.getScene("levels.scene9") then composer.removeScene("levels.scene9", false) end
      if nil~= composer.getScene("levels.scene10") then composer.removeScene("levels.scene10", false) end
      if nil~= composer.getScene("levels.scene11") then composer.removeScene("levels.scene11", false) end
      if nil~= composer.getScene("levels.scene12") then composer.removeScene("levels.scene12", false) end
      if nil~= composer.getScene("levels.scene13") then composer.removeScene("levels.scene13", false) end
      if nil~= composer.getScene("levels.scene14") then composer.removeScene("levels.scene14", false) end
      if nil~= composer.getScene("levels.scene15") then composer.removeScene("levels.scene15", false) end
      if nil~= composer.getScene("levels.scene16") then composer.removeScene("levels.scene16", false) end
      if nil~= composer.getScene("levels.scene17") then composer.removeScene("levels.scene17", false) end
      if nil~= composer.getScene("levels.scene18") then composer.removeScene("levels.scene18", false) end
      if nil~= composer.getScene("levels.scene19") then composer.removeScene("levels.scene19", false) end
      if nil~= composer.getScene("levels.scene20") then composer.removeScene("levels.scene20", false) end
      if nil~= composer.getScene("levels.scene21") then composer.removeScene("levels.scene21", false) end
      if nil~= composer.getScene("levels.scene22") then composer.removeScene("levels.scene22", false) end
      if nil~= composer.getScene("levels.scene23") then composer.removeScene("levels.scene23", false) end
      if nil~= composer.getScene("levels.scene24") then composer.removeScene("levels.scene24", false) end
      if nil~= composer.getScene("levels.scene25") then composer.removeScene("levels.scene25", false) end
      if nil~= composer.getScene("levels.scene26") then composer.removeScene("levels.scene26", false) end
      if nil~= composer.getScene("levels.scene27") then composer.removeScene("levels.scene27", false) end
      if nil~= composer.getScene("levels.scene28") then composer.removeScene("levels.scene28", false) end
      if nil~= composer.getScene("levels.scene29") then composer.removeScene("levels.scene29", false) end
      if nil~= composer.getScene("levels.scene30") then composer.removeScene("levels.scene30", false) end
        if nil~= composer.getScene("levels.rewards") then composer.removeScene("levels.rewards", false) end

        if attivaEffettoMappa then 
        local channel2= audio.findFreeChannel(2)
  audio.setVolume( partitaS:volumeEffettoSonoro(), {channel=channel2}  )
  audio.play(openMappa,{channel= channel2})
  attivaEffettoMappa= false 
end
         
        -- Code here runs when the scene is entirely on screen
 
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