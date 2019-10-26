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
 
 p1 = partitaS:torre().primoPiano
 p2 = partitaS:torre().secondoPiano
 p3 = partitaS:torre().terzoPiano
 lista= {}
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 local function creaMappa(stanza, iter)
    --m= margine per distaccare le stanza
    --l= larghezza stanza == a= altezza stanza
     if(stanza==nil) then 
        return true
else
    print(stanza.nome)
local margine= 2
local altezza = 20
local larghezza= 20

 rect = display.newRect( _w + (stanza.coordinate.x* (larghezza + margine)), _h - (stanza.coordinate.y *(larghezza + margine)), 20, 20 )
if stanza.isLocked==false then
    rect:setFillColor(1,0,0)
end
if stanza.tipo== "tesoro" then 
    rect:setFillColor(1,1,0)
end
if stanza.tipo == "uscita" then
    rect:setFillColor(0,1,0)
end
 if stanza.nord ~= nil then
 porta = display.newRect( rect.x, rect.y - 10, 8, 4)
 porta:setFillColor( 0,0,1 )
 table.insert(lista,stanza.nord)
end
 if stanza.est ~= nil then
 porta = display.newRect( rect.x + 10, rect.y , 8, 4)
 porta:setFillColor( 0,0,1 )
  table.insert(lista,stanza.est)
end
 if stanza.ovest ~= nil then
 porta = display.newRect( rect.x-10, rect.y , 8, 4)
 porta:setFillColor( 0,0,1 )
  table.insert(lista,stanza.ovest)
end
 if stanza.sud ~= nil then
 porta = display.newRect( rect.x, rect.y + 10, 8, 4)
 porta:setFillColor( 0,0,1 )
  table.insert(lista,stanza.sud)
end
new_iter= iter +1
creaMappa(lista[new_iter], new_iter)
end
end
-- create()
function scene:create( event )
    local indicePartenza= 0
     creaMappa(p3.start,indicePartenza )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
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