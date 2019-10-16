local _M = {}
require("lib.LD_LoaderX")
require ("lib.partitaStoria")
local myLevel = {}
myLevel = LD_Loader:new()
myLevel:loadLevel("ui")
led_acceso = display.newImageRect("images/led acceso.png",  30,30 )
require ("lib.partitaStoria")
local statistiche= partitaS:stats()
local numeroPalle
local vecchiaPalla

function _M.newUI()
	numeroPalle = statistiche.numeroPalle
	for  i= (numeroPalle -1) ,10 do     -- -1 perchè una palla sta nel cannone

		print("ball_"..i)
		local obj = myLevel:getLayerObject("ui_layer", "ball_"..string.format(i)).view
		obj:removeSelf()
		obj=nil
	end

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
    local txt_damage  = display.newText( stats.danno , 240, 95 , native.systemFontBold,45 )
    local txt_balls   = display.newText( stats.numeroPalle , 240, 135 , native.systemFontBold,45 )
    local txt_speed   = display.newText( stats.velocita , 240, 180 , native.systemFontBold,45 )
    local txt_bounce  = display.newText( stats.rimbalzo , 240, 225 , native.systemFontBold,45 )
    local txt_size    = display.newText( stats.grandezza , 240, 267 , native.systemFontBold,45 )
    local txt_density = display.newText( stats.densita , 240, 310 , native.systemFontBold ,45)
    local txt_luck    = display.newText( stats.fortuna , 240, 350 , native.systemFontBold ,45)
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
		local rectBalls = myLevel:getLayerObject("invisible_layer", "rect_balls").view
		rectBalls.alpha= 0;
    led_acceso.x = myLevel:getLayerObject("ui_layer" ,"led spento_0").view.x led_acceso.y = myLevel:getLayerObject("ui_layer" ,"led spento_0").view.y
    led_acceso.alpha = 0
    buttonPausa:addEventListener('tap',function(event) physics.pause() isPaused=true creaPausa() end)
    buttonStats:addEventListener('tap',function(event) physics.pause() isPaused=true creaStatistiche() end)

function myLevel:caricaPalla()
	if vecchiaPalla ~= nil then
		vecchiaPalla= nil
	end
	numeroPalle= numeroPalle -1
  obj = myLevel:getLayerObject("ui_layer", "ball_"..string.format(numeroPalle -1)).view
	obj:setLinearVelocity(150,0)
	vecchiaPalla= obj
end
return myLevel
end
return _M
