_W = display.contentWidth
_H = display.contentHeight
local muroSinistra = display.newRect( 0, _H/2, 0 ,_H )
local muroDestra = display.newRect( _W, _H/2, 0 , _H)
local muroInBasso = display.newRect( _W/2, _H+15, _W, 0 )
local muroInAlto = display.newRect( _W/2, -5, _W, 0 )
physics.addBody( muroSinistra,"static")
physics.addBody( muroDestra,"static")
physics.addBody( muroInBasso,"static")
physics.addBody( muroInAlto,"static")
local bg = display.newRect( _W/2, _H/2, _W, _H )
bg.alpha=0.1 bg.name="bg"
local canShoot = true
local potereAttivato = false
local numBallMax = 12
txt_numBallMax = display.newText( "numero palle = "..numBallMax, _W/2 - 100 ,  50, native.systemFont,12 )
local txt_SpecialeVisibile = false
local txt_Attivo = display.newText( "", display.contentWidth/2 +50 ,  50, native.systemFont,12 )

Livello = {}
Livello_mt =  {__index = Livello}

function Livello:new()

end

 function Livello:prova()
  print("****************************Livello funziona*****************************************************")
end

function Livello:funzione(parametro1, parametro2)

end
---------------------------------------------------------------------------------
--FUNZIONE DI RIMOZIONE BLOCCHI
---------------------------------------------------------------------------------
function removeBrick(brick)
  brick.scritta:removeSelf()
	brick:removeSelf()
	brick = nil
	nMattoni = nMattoni - 1
	if nMattoni == 0 then
		local txt = display.newText( "Hai vinto! Campione!", _W/2, _H/2 , native.systemFont,12 )
end end
---------------------------------------------------------------------------------
--FUNZIONE QUANDO AVVIENE COLLISIONE TRA BLOCCHI E PALLA
---------------------------------------------------------------------------------
function hit(event)
	if event.target.name == 'speciale' then
		if not txt_SpecialeVisibile then
		  txt_Speciale = display.newText( "Potere speciale attivo \n per il successivo tiro", _W/2 +100 ,  60, native.systemFont,12 )
		 txt_SpecialeVisibile = true
		end
		potereAttivato = true
		end
	physics.setGravity( 0, 46 )
	        brick = event.target
            local vx, vy = event.other:getLinearVelocity()
			brick.life = brick.life - (damage)

			if brick.life <= 0 then
               removeBrick(brick)
             else
                brick.scritta.text= brick.life
             --	brick.alpha = (brick.life/(5*100))*50
             end
           end
---------------------------------------------------------------------------------
--FUNZIONE QUANDO AVVIENE COLLISIONE TRA MURI E PALLA
---------------------------------------------------------------------------------
function hitMuro(event)
physics.setGravity( 0, 46 )
end
---------------------------------------------------------------------------------
--FUNZIONI TOUCH AUSILIARIE
---------------------------------------------------------------------------------
 local function touchBg(event)
    	if not isPaused then
      if event.phase == 'began' or event.phase == 'moved' then
        cannon:getAngle(event.x,event.y)
      elseif event.phase == 'ended' and canShoot then
      if potereAttivato then txt_Attivo:removeSelf() end
      numBallMax = numBallMax - 1
      txt_numBallMax:removeSelf()
      txt_numBallMax = display.newText( "numero palle = "..numBallMax, _W/2 - 100 ,  50, native.systemFont,12 )
      cannon:shoot(event,potereAttivato) potereAttivato=false canShoot=false  end
          end
          end
---------------------------------------------------------------------------------
--FUNZIONE TOUCH
---------------------------------------------------------------------------------
  local function touch(event)
  	if event.target.name == "bg" then
      if not((event.x < 32 and event.y > 415) or (event.x > 256 and event.y > 415)) then
  		touchBg(event) end end
  	end
---------------------------------------------------------------------------------
--FUNZIONE FINE PARTITA
---------------------------------------------------------------------------------
local function finePartita()
	local txtFinePartita = display.newText( "Hai perso, coglione!", _W/2, _H/2 , native.systemFont,12 )
end
---------------------------------------------------------------------------------
--CREAZIONE CANNONE AGGIUNTA LISTENER
---------------------------------------------------------------------------------
local newCannon = require('lib.cannon').newCannon
cannon = newCannon()
bg:addEventListener("touch", touch )
muroInBasso:addEventListener( "collision", function(event)
  event.other:removeSelf( )
  event.other = nil
  if numBallMax>0 then  --se ci sono palline
    canShoot = true   --si può sparare di nuovo
    else finePartita() end
    if potereAttivato then
    led_acceso.alpha=1
  txt_Attivo = display.newText( "Potere speciale attivo", display.contentWidth/2 + 100 ,  50, native.systemFont,12 )
  else led_acceso.alpha = 0 end
    if txt_SpecialeVisibile then txt_SpecialeVisibile = false txt_Speciale:removeSelf() end
 end )
muroSinistra:addEventListener( "preCollision", hitMuro)
muroDestra:addEventListener( "preCollision", hitMuro)
