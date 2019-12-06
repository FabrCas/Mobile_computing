local M = {}
local composer = require( "composer" )
local physics = require ("physics")
require ("lib.partita")
--arcade deve creare invece 
local statistiche
local numeroPalle
local led_acceso
local isPaused
local tempoInizioPausa
local tempoFinePausa
local tempoPausaTotale
local tempoInizioLivello

function startFunzioni()
  print("starto funzione tower")
statistiche= partita:statsS()
numeroPalle = statistiche.numeroPalle
isPaused = false
tempoInizioPausa = 0
tempoFinePausa = 0
tempoPausaTotale = 0
tempoInizioLivello = os.time()
end


function distruggiFunzioni()
M= nil 
end 

local vecchiaPalla
 function creaCannone(cannon)
  numeroPalle = statistiche.numeroPalle
  _G.gruppoLivello = display.newGroup( )
    _G.canShoot = true 
    _G.potereAttivato = false
    _G.numBallMax = partita:statsS().numeroPalle
  display.setDefault( "isAnchorClamped", false )
  cannon.x = display.contentWidth/2
    cannon.y = 60  --50
    cannon.anchorY = 0.35
     print(  "Tower funzioni invocata")
      local rect = display.newRect( 0, _H/2,50,50 )
      rect:addEventListener( "tap", function() physics.setDrawMode( "hybrid" )  end)
      local rect = display.newRect( 0, _H/2 +50,50,50 )
      rect:addEventListener( "tap", function() physics.setDrawMode( "normal" )  end)
end
---------------------------------------------------------------------------------
-- FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
---------------------------------------------------------------------------------
function caricaPalla()
  print("numeroPalle = ", numeroPalle)
  if vecchiaPalla ~= nil then
    vecchiaPalla= nil
  end
  numeroPalle= numeroPalle -1
    if numeroPalle>0 then
  obj = myUI:getLayerObject("ui_layer", "ball_"..string.format(numeroPalle-1)).view
  obj:setLinearVelocity(150,0)
  print("obj = ",obj)
  vecchiaPalla= obj end end
---------------------------------------------------------------------------------
-- FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
---------------------------------------------------------------------------------
  function getAngle(sx,sy,cannon) --FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
         local angolo
         local latoVerticale = sy
         local latoObliquo = math.sqrt(math.pow((display.contentWidth/2 - sx),2)+math.pow(( - sy),2))
         angoloRad = (math.acos(latoVerticale/latoObliquo))  --radianti
         angolo= ((angoloRad*180)/3.14)
         if (sx < display.contentWidth/2) then
         cannon.rotation = angolo
       else cannon.rotation = -angolo end
       end --FINE FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
---------------------------------------------------------------------------------
-- FUNZIONE PER CREAZIONE PALLA
---------------------------------------------------------------------------------
       function creaPalla(sx,sy,potereAttivato, angolo)
        if potereAttivato then
   ball = display.newImageRect("images/PallaSpeciale"..partita:personaggio()..".png", 15, 15)
   partita:statsS().danno = 10
   --physics.addBody(ball, 'static' , {radius=7.5,bounce=0.8,friction=0.3})S
  else
    ball = display.newImageRect("images/default ball.png", 15, 15)
    partita:statsS().danno = 1
        end
    ball.x  = display.contentWidth/2
    ball.y = 60-- 130
    print("stampe")
    print(angolo)
    print(72.5/ball.contentHeight)
    ball.anchorY= -4.83 --4,83
    ball.anchorX= 0.5--72.5/ball.contentWidth
    ball.rotation=  angolo
    if potereAttivato then
    physics.addBody(ball, 'static' , {radius=7.5,bounce=0.8,friction=0.3})
else physics.addBody(ball, 'static' , {radius=7.5,bounce=0.8}) end
    ball.density= 0.73
    gruppoLivello:insert(ball)
    -- While the ball rests near the cannon, it's static
    ball.isLaunched = false
     ball.isLaunched = true
     ball.bodyType = 'dynamic' -- Change to dynamic so it can move
     deltaX = sx - display.contentWidth/2
       deltaY = sy
       normDeltaX = deltaX / math.sqrt(deltaX^2 + deltaY^2)
       normDeltaY = deltaY / math.sqrt(deltaX^2 + deltaY^2)
       speed = 700
       physics.setGravity(0, 0)
       ball:setLinearVelocity( normDeltaX * speed, normDeltaY * speed )
end
---------------------------------------------------------------------------------
-- FUNZIONE DI SHOOTING
---------------------------------------------------------------------------------
  function shoot(event,potereAttivato,cannon)
    caricaPalla()
    print("cannon:shoot",potereAttivato)
    sx,sy= event.x , event.y
    getAngle(sx,sy,cannon)
    local ball = creaPalla(sx,sy,potereAttivato, cannon.rotation)
 -- if ball and not ball.isLaunched then
    cannon:play()
  --  ball:launch()
    end
---------------------------------------------------------------------------------
--FUNZIONE QUANDO AVVIENE COLLISIONE TRA MURI E PALLA
---------------------------------------------------------------------------------
function hitMuro(event)
physics.setGravity( 0, 46 )
end
---------------------------------------------------------------------------------
-- FUNZIONI LIVELLO
---------------------------------------------------------------------------------
function creaLivello(cannon)
local muroSinistra = display.newRect( 0, _H/2, 0 ,_H )
local muroDestra = display.newRect( _W, _H/2, 0 , _H)
local muroInBasso = display.newRect( _W/2, _H+15, _W, 0 )
local muroInAlto = display.newRect( _W/2, -5, _W, 0 )
physics.addBody( muroSinistra,"static")
physics.addBody( muroDestra,"static")
physics.addBody( muroInBasso,"static")
physics.addBody( muroInAlto,"static")
gruppoLivello:insert(muroSinistra)
gruppoLivello:insert(muroDestra)
gruppoLivello:insert(muroInBasso)
gruppoLivello:insert(muroInAlto)
muroInBasso:addEventListener( "collision", function(event) 
  event.other:removeSelf( )
  event.other = nil
  if numBallMax>0 then  --se ci sono palline
    canShoot = true   --si può sparare di nuovo
    else finePartita() end
    if potereAttivato then
    led_acceso.alpha=1
  else led_acceso.alpha = 0
   end
 end )
muroSinistra:addEventListener( "preCollision", hitMuro)
muroDestra:addEventListener( "preCollision", hitMuro)
local bg = display.newRect( _W/2, _H/2, _W, _H )
bg.alpha=0.01 bg.name="bg"
bg:addEventListener("touch", function(event) touch(event,cannon) end )
gruppoLivello:insert(bg)
end
---------------------------------------------------------------------------------
--FUNZIONE DI RIMOZIONE BLOCCHI
---------------------------------------------------------------------------------
function removeBrick(brick, mod)
  brick.scritta:removeSelf()
  brick:removeSelf()
  brick = nil
  nMattoni = nMattoni - 1
  if nMattoni == 25 then
    local txt = display.newText( "Hai vinto! Campione!", _W/2, _H/2 , native.systemFont,12 )
    gruppoLivello:insert(txt)

   local function toNextLevel(event)
    scancellaTutto()
    composer.gotoScene("levels.mappa")
  end

    timer.performWithDelay( 1000, toNextLevel )

  
   --DA SISTEMARE partitaS:aggiungiscore(500,(os.time() - tempoInizioLivello)+tempoPausaTotale, numBallMax,false)
end end
---------------------------------------------------------------------------------
--FUNZIONE QUANDO AVVIENE COLLISIONE TRA BLOCCHI E PALLA
---------------------------------------------------------------------------------
function hit(event, mod)
  local brick_colpito = display.newImageRect("images/hitten-brick.png",30,50)
  brick_colpito.x = event.target.x
  brick_colpito.y = event.target.y
  if event.target.name == 'speciale' then
    potereAttivato = true
    led_acceso.alpha=1
    end
  physics.setGravity( 0, 46 )
          brick = event.target
          local vx, vy = event.other:getLinearVelocity()
      brick.life = brick.life - (partita:statsS().danno)

      if brick.life <= 0 then
               removeBrick(brick, mod)
             else
                brick.scritta.text= brick.life
             -- brick.alpha = (brick.life/(5*100))*50
             end
             timer.performWithDelay( 100, function() brick_colpito.alpha = 0 end )
           end
---------------------------------------------------------------------------------
--FUNZIONI TOUCH AUSILIARIE
---------------------------------------------------------------------------------
 function touchBg(event,cannon)
      if not isPaused then
      if event.phase == 'began' or event.phase == 'moved' then
        getAngle(event.x,event.y,cannon)
      elseif event.phase == 'ended' --and canShoot 
      then
      numBallMax = numBallMax - 1
      shoot(event,potereAttivato,cannon) potereAttivato=false canShoot=false  end
          end 

        end
---------------------------------------------------------------------------------
--FUNZIONE TOUCH
---------------------------------------------------------------------------------
 function touch(event,cannon)
  if not isPaused then
    if event.target.name == "bg" then
      if not((event.x < 32 and event.y > 415) or (event.x > 256 and event.y > 415)) then
      touchBg(event,cannon) end end
    end end
---------------------------------------------------------------------------------
--FUNZIONE FINE PARTITA
---------------------------------------------------------------------------------
 function finePartita()
  local txtFinePartita = display.newText( "Hai perso, coglione!", _W/2, _H/2 , native.systemFont,12 )
  gruppoLivello:insert(txtFinePartita)
  partita:aggiungiscore(500,(os.time() - tempoInizioLivello) - tempoPausaTotale, numBallMax,true)
end
---------------------------------------------------------------------------------
--FUNZIONI PALLA
---------------------------------------------------------------------------------
function scancellaTutto()
gruppoLivello:removeSelf( )
cannone:removeSelf()
end
---------------------------------------------------------------------------------
--FUNZIONE CREAZIONE UI
---------------------------------------------------------------------------------
function creaUI(screenGroup)
  _G.myUI = LD_Loader:new(screenGroup)
  myUI:loadLevel("levels.ui")
  led_acceso = display.newImageRect("images/led acceso.png",  30,30 )
  gruppoLivello:insert(led_acceso)
  local buttonPausa = myUI:getLayerObject("invisible_layer", "buttonPausa").view
    local buttonStats = myUI:getLayerObject("invisible_layer", "buttonStats").view
    local rectBalls = myUI:getLayerObject("invisible_layer", "rect_balls").view
    rectBalls.alpha= 0;
    led_acceso.x = myUI:getLayerObject("ui_layer" ,"led spento_0").view.x led_acceso.y = myUI:getLayerObject("ui_layer" ,"led spento_0").view.y
    led_acceso.alpha = 0
    buttonPausa:addEventListener('tap',function(event) if isPaused == false then physics.pause() isPaused=true creaPausa() end end)
    buttonStats:addEventListener('tap',function(event) if isPaused == false then physics.pause() isPaused=true creaStatistiche() end end)
    gruppoLivello:insert(buttonPausa)
    gruppoLivello:insert(buttonStats)

    for  i= (numeroPalle -1) ,10 do     -- -1 perchè una palla sta nel cannone
    --print("ball_"..i)
    local obj = myUI:getLayerObject("ui_layer", "ball_"..string.format(i)).view
    obj:removeSelf()
    obj=nil
  end

end
function creaGruppo()
gruppo=display.newGroup( )
print("creaGruppo")
  return gruppo
end
---------------------------------------------------------------------------------
--FUNZIONE CHE CREA LA PAUSA
---------------------------------------------------------------------------------
 function creaPausa()
  tempoInizioPausa = os.time()
  gruppoPausa = creaGruppo()
  isPaused=true

  local testoVolumeMusica
  local testoVolumeEffettoSonoro
  --listener
  local function onButtonClickUpMusica(event)
      partita:aumentaVolumeMusica()
      audio.setVolume( partita:volumeMusica(), {channel=1}  )
      testoVolumeMusica.text= (partita:volumeMusica() * 10)
  end

  local function onButtonClickDownMusica(event)
      partita:diminuisciVolumeMusica()
      audio.setVolume( partita:volumeMusica(), {channel=1}  )
      if (partita:volumeMusica()*10)>0 and (partita:volumeMusica()*10)<1  then
          testoVolumeMusica.text= 0
      else
      testoVolumeMusica.text= (partita:volumeMusica() * 10)
  end end

  local function onButtonClickDownEffettoSonoro(event)
      partita:diminuisciVolumeEffettoSonoro()
      audio.setVolume(partita:volumeEffettoSonoro(), {channel=2}  )
      if (partita:volumeEffettoSonoro()*10)>0 and (partita:volumeEffettoSonoro()*10)<1  then
          testoVolumeEffettoSonoro.txt=0
      else
      testoVolumeEffettoSonoro.text= (partita:volumeEffettoSonoro() * 10)
  end end

  local function onButtonClickUpEffettoSonoro(event)
       partita:aumentaVolumeEffettoSonoro()
      audio.setVolume(partita:volumeEffettoSonoro(), {channel=2} )
      testoVolumeEffettoSonoro.text= (partita:volumeEffettoSonoro() * 10)
  end

   

local pausa = {}
pausa = LD_Loader:new(gruppoPausa)
pausa:loadLevel("schermat_pausa_level")
immagine_pausa = pausa:getLayerObject("pulsanti", "finestra_pausa_0").view


local rectMusica = pausa:getLayerObject("pulsanti", "rect_9").view
local rectEffetti = pausa:getLayerObject("pulsanti", "rect_8").view
testoVolumeMusica= display.newText((partita:volumeMusica() * 10),rectMusica.x,rectMusica.y)
testoVolumeMusica:setFillColor(0,0,0)
testoVolumeEffettoSonoro= display.newText((partita:volumeEffettoSonoro() * 10),rectEffetti.x,rectEffetti.y)
testoVolumeEffettoSonoro:setFillColor(0,0,0)

local fxp = pausa:getLayerObject("pulsanti", "volumeeffetti+").view
fxp.alpha = 0.01

local fxm = pausa:getLayerObject("pulsanti", "volumeeffetti-").view
fxm.alpha = 0.01

local musicap = pausa:getLayerObject("pulsanti", "volumemusica-").view
musicap.alpha = 0.01

local musicam = pausa:getLayerObject("pulsanti", "volumemusica+").view
musicam.alpha = 0.01

local backtomenu = pausa:getLayerObject("pulsanti", "backtomenu").view
backtomenu.alpha = 0.01

local ok = pausa:getLayerObject("pulsanti", "ok").view
gruppoPausa:insert(immagine_pausa) gruppoPausa:insert(fxp) gruppoPausa:insert(fxm)
gruppoPausa:insert(musicap) gruppoPausa:insert(musicam) gruppoPausa:insert(backtomenu)
gruppoPausa:insert(ok)
ok.alpha = 0.01
ok:addEventListener("tap",function(event) isPaused=false physics.start() 
  physics.setGravity(0,40)
gruppoPausa:removeSelf() print("tolto da 'ok' ") tempoFinePausa=os.time() --rimuove la pausa
tempoPausaTotale = tempoPausaTotale + (tempoFinePausa - tempoInizioPausa)
print("tempo di pausa totale",tempoPausaTotale)
testoVolumeMusica:removeSelf()
testoVolumeEffettoSonoro:removeSelf()
testoVolumeEffettoSonoro= nil
testoVolumeMusica= nil
end)
musicam:addEventListener("tap", onButtonClickUpMusica)
musicap:addEventListener("tap", onButtonClickDownMusica)
fxp:addEventListener("tap", onButtonClickUpEffettoSonoro)
fxm:addEventListener("tap", onButtonClickDownEffettoSonoro)
backtomenu:addEventListener("tap", function()
  numeroPalle = statistiche.numeroPalle
  isPaused=false
    scancellaTutto() --rimuove gruppolivello e cannone
    gruppoPausa:removeSelf() print("tolto da backtomenu ")
    testoVolumeMusica:removeSelf()
testoVolumeEffettoSonoro:removeSelf()
testoVolumeEffettoSonoro= nil
testoVolumeMusica= nil
composer.removeScene("scene1")
    timer.performWithDelay(500, function() composer.gotoScene("toMenu") end )
  end)

end
---------------------------------------------------------------------------------
--FUNZIONE CHE CREA LA SCHERMATA DI STATISTICHE
---------------------------------------------------------------------------------
 function creaStatistiche()
local schermataStatistiche = display.newImageRect("images/stat window.png" ,320,480)
      schermataStatistiche.x = _W/2 schermataStatistiche.y = _H/2
      local chiudi = display.newRect( 238,420, 75,75 )
      chiudi.alpha = 0.01
      local stats = partita:statsS()
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

M.testFunction = testFunction
M.creaCannone = creaCannone
M.getAngle = getAngle
M.shoot = shoot
---------------------------------------------------------------------------------
M.startFunzioni = startFunzioni
M.creaLivello = creaLivello
M.removeBrick = removeBrick
M.hit = hit
M.hitMuro = hitMuro
M.touchBg = touchBg
M.touch = touch
M.finePartita = finePartita
M.scancellaTutto = scancellaTutto
M.creaUI = creaUI
M.distruggiFunzioni= distruggiFunzioni


return M
