local composer = require( "composer" )
require ("lib.partitaStoria")
local scene = composer.newScene()
local _w = display.contentWidth/2
local _h = display.contentHeight/2
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 partitaS:new()
 local p1, p2, p3
 torre = partitaS:torre()
 p1 = partitaS:torre().primoPiano
 p2 = partitaS:torre().secondoPiano
 p3 = partitaS:torre().terzoPiano

 lista= {}  --lista delle stanze da creare
 listaRect={}  --lista grafica delle stanze 
 listaPorte={}  --lista grafica delle porte, da levare? 

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
local background = display.newImage(composer.imgDir .. "scrollBg.jpg", 0, 0, true)
    background.anchorX = 0
    background.anchorY = 0
    background.width= 320
    background.height= 480
    sceneGroup:insert(background)

local testoSchermata = display.newImage(composer.imgDir .. "testoMappa.png", 0, 0, true)
testoSchermata.anchorX = 0
    testoSchermata.anchorY = 0
    testoSchermata.width= 320
    testoSchermata.height= 480
    sceneGroup:insert(testoSchermata)

local testoPiano = display.newImage(composer.imgDir .. "primoPiano.png", 0, 38, true)
testoPiano.anchorX = 0
    testoPiano.anchorY = 0
    testoPiano.width= 320
    testoPiano.height= 25
    sceneGroup:insert(testoPiano)


local function onButtonClickStanzaSelezionata(event)
    composer.gotoScene("levels.scene1")
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
            print("lista rect valore: ")
            print (#listaRect)
            cancellaMappa(listaRect, listaPorte)
            lista= nil
            lista= {}
            creazione()
end

local function onButtonClickStanzaSelezionataDadi(event)

end

local function onButtonClickStanzaSelezionataUscita(event)
    print("uscita selezionata")
    cancellaMappa(listaRect, listaPorte)
    lista= nil
    lista= {}
    sceneGroup:remove(testoPiano)
    testoPiano:removeSelf()
    testoPiano= nil
    if (torre.pianoAttuale<2) then 
    torre.pianoAttuale= torre.pianoAttuale+1
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

    creazione()
else
    return true  --aggiungere schermata di vittoria o boss fight finale 
end
end

local function creaMappa(stanza, iter)
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
    rect:addEventListener("tap", onButtonClickStanzaSelezionata)
elseif stanza.tipo == "uscita" then
    rect = display.newImage( composer.imgDir .."stanzaUscita.png", _w + (stanza.coordinate.x* (larghezza + margine)), _h - (stanza.coordinate.y *(larghezza + margine)))
    table.insert(listaRect, rect)
    sceneGroup:insert(rect)
    --prossimo piano se 1 o 2, vittoria se 3
    rect:addEventListener("tap", onButtonClickStanzaSelezionataUscita)
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

 creazione()

end --fine create()

 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        if nil~= composer.getScene("toPlay") then composer.removeScene("toPlay", false) end
       --   if nil~= composer.getScene("levels.scene1") then composer.removeScene("levels.scene1", false) end
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