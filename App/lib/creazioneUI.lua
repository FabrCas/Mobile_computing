local _M = {}
require("lib.LD_LoaderX")
local myLevel = {}
myLevel = LD_Loader:new()
myLevel:loadLevel("ui")
function _M.newUI()
	require ("lib.partitaStoria")
	
---------------------------------------------------------------------------------
--FUNZIONE CHE CREA LA PAUSA
---------------------------------------------------------------------------------
local function creaPausa()
local schermataPausa = display.newRect( _W/2, _H/2, 100, 100 )
    	 schermataPausa:addEventListener("tap",function(event) isPaused=false physics.start() schermataPausa:removeSelf( ) schermataPausa=nil end)

end
---------------------------------------------------------------------------------
--FUNZIONE CHE CREA LA SCHERMATA DI STATISTICHE
---------------------------------------------------------------------------------
local function creaStatistiche()
local schermataStatistiche = display.newImageRect("images/stat window.png" ,320,480)
      schermataStatistiche.x = _W/2 schermataStatistiche.y = _H/2
      local chiudi = display.newRect( 238,420, 75,75 )
      chiudi.alpha = 0.01
      local stats = partitaS:stats()
      local gruppo_testo = display.newGroup( )
    local txt_damage  = display.newText( stats.danno , 240, 90 , native.systemFontBold,45 )     
    local txt_balls   = display.newText( stats.numeroPalle , 240, 135 , native.systemFontBold,45 )     
    local txt_speed   = display.newText( stats.velocita , 240, 180 , native.systemFontBold,45 )     
    local txt_bounce  = display.newText( stats.rimbalzo , 240, 225 , native.systemFontBold,45 )    
    local txt_size    = display.newText( stats.grandezza , 240, 270 , native.systemFontBold,45 )    
    local txt_density = display.newText( stats.densita , 240, 315 , native.systemFontBold ,45)    
    local txt_luck    = display.newText( stats.fortuna , 240, 360 , native.systemFontBold ,45)    
    gruppo_testo:insert(txt_damage)
    gruppo_testo:insert(txt_balls)
    gruppo_testo:insert(txt_speed)
    gruppo_testo:insert(txt_bounce)
    gruppo_testo:insert(txt_size)
    gruppo_testo:insert(txt_density)
    gruppo_testo:insert(txt_luck)
    txt_damage:setStrokeColor( 0, 0, 0 ,255)
    txt_damage.strokeWidth = 80
    txt_damage:setFillColor( 1, 0, 0 )
    txt_damage:setFillColor(1,0,0) 
    txt_balls:setFillColor(1,0,0)  
    txt_speed:setFillColor(1,0,0) 
    txt_bounce:setFillColor(1,0,0) 
    txt_size:setFillColor(1,0,0)   
    txt_density:setFillColor(1,0,0)
    txt_luck:setFillColor(1,0,0) 
      chiudi:addEventListener("tap",function(event) gruppo_testo:removeSelf() gruppo_testo = nil isPaused=false physics.start() chiudi:removeSelf() chiudi = nil schermataStatistiche:removeSelf( ) schermataStatistiche=nil end)
end

    local buttonPausa = myLevel:getLayerObject("invisible_layer", "buttonPausa").view
    local buttonStats = myLevel:getLayerObject("invisible_layer", "buttonStats").view

    buttonPausa:addEventListener('tap',function(event) physics.pause() isPaused=true creaPausa() end)
    buttonStats:addEventListener('tap',function(event) physics.pause() isPaused=true creaStatistiche() end)
end

return _M
