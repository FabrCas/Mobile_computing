local M = {}
local composer = require( "composer" )
local physics = require ("physics")
require ("lib.partitaStoria")
tapSound2= audio.loadSound("sounds/brickStricked.mp3")
--arcade deve creare invece
local preference = require "lib.preference"

local isDefeatedWon

require("lib.LD_HelperX")
require("lib.LD_LoaderX")
local _W = display.contentWidth
local _H = display.contentHeight

local a = 225
local gruppoLivello
local pg

local statistiche                              --=partitaS:stats()
local numeroPalle                              --= statistiche.numeroPalle
print("creazione partita - " .. mod_par)
local led_acceso
local pall_lanciata --= nil
local nTiri
local bg
isPaused = false
tempoInizioPausa = 0
tempoFinePausa = 0
tempoPausaTotale = 0
tempoInizioLivello = os.time()
local danno

function creaPartita()
if mod_par=="arcade" then
partitaS:new()
end
danno = partitaS:stats().danno
 statistiche=partitaS:stats()
 numeroPalle = statistiche.numeroPalle
print("creazione partita - creaPartita " .. mod_par)
 pall_lanciata = nil
isPaused = false
tempoInizioPausa = 0
tempoFinePausa = 0
tempoPausaTotale = 0
tempoInizioLivello = os.time()
isDefeatedWon= false
end

local vecchiaPalla
 function creaCannone(cannon,cerchio)
  creaPartita()
  nTiri=0
  print("numero palle = " .. statistiche.numeroPalle .. mod_par)
  numeroPalle = statistiche.numeroPalle

   gruppoLivello = display.newGroup( )

   local circle = display.newCircle( _W/2, 60, 40 )
   gruppoLivello:insert(circle)
   circle:toFront( )
   circle:setFillColor( 0,0,0 )
   livelloPG = LD_Loader:new(gruppoLivello)
   livelloPG:loadLevel("personaggi." .. partitaS:personaggio())
   pg = livelloPG:getLayerObject("Layer 1", partitaS:personaggio() ).view

   pg.x = _W/2
   pg.y= 60
   print("FDHSKJFS pg.w " , pg.width .. " pg.h" , pg.height)
 --  pg.width = a
 --  pg.height = a
   print("il frame e " , pg.frame)
    _G.canShoot = true
    _G.potereAttivato = false
    _G.numBallMax = partitaS:stats().numeroPalle
  display.setDefault( "isAnchorClamped", false )
  cannon.x = _W/2
    cannon.y = 60  --50
    cannon.anchorY = 0.33
    cerchio.view.x = cannon.x cerchio.view.y=60
      --print(  "FDJSPOFKSDPOODFJKSPOKFDSPKTest function called")
      local rect = display.newRect( 0, _H/2,50,50 )
      rect:addEventListener( "tap", function() physics.setDrawMode( "hybrid" ) preference.save{b="500"}
value = preference.getValue("b")
print("Retrieving string b from rect: ",value)  end)
      local rect1 = display.newRect( 0, _H/2 +50,50,50 )
      rect1:addEventListener( "tap", function() physics.setDrawMode( "normal" ) value = preference.getValue("b")
      print("Retrieving string b from rect1 : ",value)  end)
      gruppoLivello:insert(rect)
      gruppoLivello:insert(rect1)
end
---------------------------------------------------------------------------------
-- FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
---------------------------------------------------------------------------------
function caricaPalla()
 -- print("numeroPalle = ", numeroPalle)
  if vecchiaPalla ~= nil then
    vecchiaPalla= nil
  end
  print("numeroPalle = " .. numeroPalle)
  numeroPalle= numeroPalle -1
  physics.start()
    if numeroPalle>0 then
  obj = myUI:getLayerObject("ui_layer", "ball_"..string.format(numeroPalle-1)).view
  obj:setLinearVelocity(150,0)
  print("obj = ",obj)
  vecchiaPalla= obj else  canShoot=false
  end
  end
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
function listenerUltimaPalla(event)
  print("lister ultima palla")
   if pall_lanciata:getLinearVelocity()~=nil
    then vx,vy = pall_lanciata:getLinearVelocity( ) end
  if vy<0 then vy=-vy end
  if vy < 100 then
    finePartita()
    Runtime:removeEventListener("enterFrame", listenerUltimaPalla)
  end
end



       function creaPalla(sx,sy,potereAttivato, angolo)
        if numBallMax == 0 then
     Runtime:addEventListener("enterFrame", listenerUltimaPalla)
   end
        if potereAttivato then
        	pg:play() --pg.width = a pg.height = a
   ball = display.newImageRect("images/PallaSpeciale"..partitaS:personaggio()..".png", partitaS:stats().grandezza, partitaS:stats().grandezza)

   partitaS:stats().danno = 10
   --physics.addBody(ball, 'static' , {radius=7.5,bounce=0.8,friction=0.3})
  else
    ball = display.newImageRect("images/default ball.png", partitaS:stats().grandezza,partitaS:stats().grandezza)
    --partitaS:stats().grandezza, partitaS:stats().grandezza)
print("palla di grandezza" .. partitaS:stats().grandezza)

    partitaS:stats().danno = danno
        end
    ball.x  = display.contentWidth/2
    ball.y = 60 -- 130
    --print("stampe") print(angolo) print(72.5/ball.contentHeight)
    ball.anchorY= - 4.83 --4,83
    ball.anchorX= 0.5--72.5/ball.contentWidth
    ball.rotation=  angolo
    if potereAttivato then
    physics.addBody(ball, 'static' , {radius=partitaS:stats().grandezza/2,bounce=((partitaS:stats().rimbalzo)/10),friction=0.3,density=partitaS:stats().densita})
else physics.addBody(ball, 'static' , {radius=partitaS:stats().grandezza/2,bounce=((partitaS:stats().rimbalzo)/10),density=partitaS:stats().densita}) end
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
       speed = (partitaS:stats().velocita*100)
       physics.setGravity(0, 0)
       ball:setLinearVelocity( normDeltaX*speed,normDeltaY*speed )
       pall_lanciata = ball
       gruppoLivello:insert(pall_lanciata)
       nTiri = nTiri + 1
end
---------------------------------------------------------------------------------
-- FUNZIONE DI SHOOTING
---------------------------------------------------------------------------------
  function shoot(event,potereAttivato,cannon)
  -- if (numBallMax) < 0 then

  --   finePartita()
  -- else

    caricaPalla()
    --print("cannon:shoot",potereAttivato)
    sx,sy= event.x , event.y
    getAngle(sx,sy,cannon)
    local ball = creaPalla(sx,sy,potereAttivato, cannon.rotation)
 -- if ball and not ball.isLaunched then
    cannon:play()
  --  ball:launch()
    --end
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
    end
    if potereAttivato then
    led_acceso.alpha=1
  else led_acceso.alpha = 0
   end
 end )
muroSinistra:addEventListener( "preCollision", hitMuro)
muroDestra:addEventListener( "preCollision", hitMuro)
bg = display.newRect( _W/2, _H/2, _W, _H )
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
  if nMattoni == 0 then
   -- local txt = display.newText( "Hai vinto! Campione!", _W/2, _H/2 , native.systemFont,12 )
    --gruppoLivello:insert(txt)
       if mod_par=="tower" then
  partitaS:aggiungiscore(500,(os.time() - tempoInizioLivello) - tempoPausaTotale, numBallMax,true)
end
     schermataVittoria()
   --DA SISTEMARE

end end


local function onButtonClick(event)
  print("bottone vinto tappato")
  local options = { effect = "crossFade", time = 200}
   scancellaTutto()
    if mod_par =="tower" then
    composer.gotoScene("levels.mappa", options)
  else
    composer.gotoScene("arcade", options)
    end
end

local function onButtonClickLose(event)
  local options = { effect = "crossFade", time = 200}
  scancellaTutto()
  print("bottone vinto tappato")
  composer.gotoScene("menu",options )
end



local function creaScore(valore,x,y)

  for i = 1, #valore do
    local c = valore:sub(i,i)
   -- print(c)
    -- do something with c
    local num = display.newImage(composer.imgDir .. c .. ".png" , (x + i*23) ,y)
    num.width= 45
    num.height= 45
    gruppoLivello:insert(num)
  end
end

function schermataVittoria()
   -- timer.performWithDelay( 500, toNextLevel )
   if isDefeatedWon == false then
   bg:removeSelf()
   bg= nil
  myLevel= LD_Loader:new(gruppoLivello)
  myLevel:loadLevel("finestra")
  local rectButton= myLevel:getLayerObject("Rects", "rect_1").view
  local rectScritta= myLevel:getLayerObject("Rects", "rect_2").view
  local rectScore= myLevel:getLayerObject("Rects", "rect_3").view

  local scritta = display.newImage( composer.imgDir .. "youWin.png" , rectScritta.x ,rectScritta.y + 12 )
  scritta.width= 320
  scritta.height= 40
  local scorep
  if mod_par=="tower" then
  scorep=partitaS:score()
else
  scorep=partitaS:getScore(500,(os.time() - tempoInizioLivello) - tempoPausaTotale, numBallMax,true)
end
  creaScore(tostring(scorep), (rectScore.x -30), rectScore.y)
  gruppoLivello:insert(scritta)
  gruppoLivello:insert(rectButton)
  gruppoLivello:insert(rectScritta)
  rectButton:addEventListener("tap", onButtonClick)
  isDefeatedWon= true
end
  end

function schermataSconfitta()
  if isDefeatedWon == false then
	print("stampa schermata")
  bg:removeSelf()
  bg= nil
  myLevel= LD_Loader:new(gruppoLivello)
  myLevel:loadLevel("finestra")
  local rectButton= myLevel:getLayerObject("Rects", "rect_1").view
  local rectScritta= myLevel:getLayerObject("Rects", "rect_2").view
  local rectScore= myLevel:getLayerObject("Rects", "rect_3").view

  local scritta = display.newImage( composer.imgDir .. "youLose.png" , rectScritta.x ,rectScritta.y + 12 )
  scritta.width= 320
  scritta.height= 40
    local scorep
  if mod_par=="tower" then
  scorep=partitaS:score()
else
  scorep=partitaS:getScore(500,(os.time() - tempoInizioLivello) - tempoPausaTotale, numBallMax,true)
end
  creaScore(tostring(scorep),(rectScore.x -30), rectScore.y)
  gruppoLivello:insert(scritta)
  gruppoLivello:insert(rectButton)
  gruppoLivello:insert(rectScritta)
  rectButton:addEventListener("tap", onButtonClickLose)
  isDefeatedWon= true
end
  end

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
    --print("coplito")
   if event.target.name == "static part ui_0" then print('funziona') end
  physics.setGravity( 0, 46 )
          brick = event.target
          local vx, vy = event.other:getLinearVelocity()
      brick.life = brick.life - (partitaS:stats().danno)

      if brick.life <= 0 then
               removeBrick(brick, mod)
             else
                brick.scritta.text = brick.life
             -- brick.alpha = (brick.life/(5*100))*50
             end
             timer.performWithDelay( 100, function() brick_colpito.alpha = 0 end )
           end
---------------------------------------------------------------------------------
--FUNZIONI TOUCH AUSILIARIE
---------------------------------------------------------------------------------
 function touchBg(event,cannon)
 -- if isPaused ==false then physics.start() end
 physics.start( )
 if nTiri==0 then canShoot = true else
 if event.phase == 'began' then
 if pall_lanciata~=nil  then
  if pall_lanciata:getLinearVelocity()~=nil
    then vx,vy = pall_lanciata:getLinearVelocity( ) end
  if vy<0 then vy=-vy end
 print("ge".. pall_lanciata.y .." " .. vy)
else print("primto tmiro") end




  if (pall_lanciata==nil or (pall_lanciata.y > 340 and vy <400)) and
      numeroPalle>0 then
      if pg.isPlaying then pg:pause() pg:setFrame(1) end
   canShoot = true end
end --event.phase
end -- if nTiri

--canShoot = true --da cancellare dopo

      if not isPaused then
      if event.phase == 'began' or event.phase == 'moved' then
        getAngle(event.x,event.y,cannon)
      elseif event.phase == 'ended' and canShoot
      then
      numBallMax = numBallMax - 1
      print("numero palle" .. numBallMax)
      shoot(event,potereAttivato,cannon) led_acceso.alpha=0 potereAttivato=false  canShoot=false
      end -- if palla lanciata ecc
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
    if mod_par=="tower" then
  partitaS:aggiungiscore(500,(os.time() - tempoInizioLivello) - tempoPausaTotale, numBallMax,true)
end
  schermataSconfitta()
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
  myUI:loadLevel("ui.ui")
  led_acceso = display.newImageRect("images/led acceso.png",  30,30 )
  gruppoLivello:insert(led_acceso)
  local buttonPausa = myUI:getLayerObject("invisible_layer", "buttonStats").view --PAUSA (anche se c'è scritto buttonStats)
    local buttonStats = myUI:getLayerObject("invisible_layer", "buttonPausa").view --STATS (anche se c'è scritto buttonPause)
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
print("creaGruppo - tower")
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
  local rectMusica
  local rectEffetti

  --listener
--*************************************up/down musica******************************************
local function onButtonClickUpMusica(event)
    testoVolumeMusica.fn:removeSelf()
    testoVolumeMusica.fn= nil
    if ( testoVolumeMusica.sn ~= nil) then
    testoVolumeMusica.sn:removeSelf()
    testoVolumeMusica.sn= nil
end
    partitaS:aumentaVolumeMusica()
    audio.setVolume( partitaS:volumeMusica(), {channel=1}  )
    creaNumeroMusica(tostring((partitaS:volumeMusica() * 10)))
    audio.play(tapSound2,{channel= 2})

end

local function onButtonClickDownMusica(event)
    testoVolumeMusica.fn:removeSelf()
    testoVolumeMusica.fn= nil
    if ( testoVolumeMusica.sn ~= nil) then
    testoVolumeMusica.sn:removeSelf()
    testoVolumeMusica.sn= nil
end
    partitaS:diminuisciVolumeMusica()
    audio.setVolume( partitaS:volumeMusica(), {channel=1}  )
    if (partitaS:volumeMusica()*10)>0 and (partitaS:volumeMusica()*10)<1  then
       creaNumeroMusica(tostring(0))
    else
    creaNumeroMusica(tostring((partitaS:volumeMusica() * 10)))
end
audio.play(tapSound2,{channel= 2})
end

--************************************************up/down sound effect*****************************
local function onButtonClickDownEffettoSonoro(event)
     testoVolumeEffettoSonoro.fn:removeSelf()
    testoVolumeEffettoSonoro.fn= nil
    if ( testoVolumeEffettoSonoro.sn ~= nil) then
    testoVolumeEffettoSonoro.sn:removeSelf()
    testoVolumeEffettoSonoro.sn= nil
end
    partitaS:diminuisciVolumeEffettoSonoro()
    audio.setVolume(partitaS:volumeEffettoSonoro(), {channel=2}  )
    if (partitaS:volumeEffettoSonoro()*10)>0 and (partitaS:volumeEffettoSonoro()*10)<1  then
        creaNumeroEffetto(tostring(0))
    else
    creaNumeroEffetto(tostring((partitaS:volumeEffettoSonoro() * 10)))
end
audio.play(tapSound2,{channel= 2})
end

local function onButtonClickUpEffettoSonoro(event)
      testoVolumeEffettoSonoro.fn:removeSelf()
    testoVolumeEffettoSonoro.fn= nil
    if ( testoVolumeEffettoSonoro.sn ~= nil) then
    testoVolumeEffettoSonoro.sn:removeSelf()
    testoVolumeEffettoSonoro.sn= nil
end
    partitaS:aumentaVolumeEffettoSonoro()
    audio.setVolume(partitaS:volumeEffettoSonoro(), {channel=2} )
    creaNumeroEffetto(tostring((partitaS:volumeEffettoSonoro() * 10)))
    audio.play(tapSound2,{channel= 2})
end
--*********************************************************************************************************

function creaNumeroMusica(valore)
    print ("valore :" .. valore )
    local num1,num2
    local char1=valore:sub(0,1)
    local char2= valore:sub(2,2)
    print (char1)
    print (char2)
if char2 == "" then
    num1=  display.newImage(composer.imgDir .. char1 .. ".png" ,rectMusica.x ,rectMusica.y)
    num2=nil
    print("case1")
else
     print("case2")
    num1=  display.newImage(composer.imgDir .. char1 .. ".png" ,rectMusica.x - 11 ,rectMusica.y)
    num2= display.newImage(composer.imgDir .. char2 .. ".png" ,rectMusica.x + 11 ,rectMusica.y)
    num2.width=45
    num2.height= 45
end
num1.width=45
num1.height= 45
testoVolumeMusica={fn=num1,sn=num2}
end

function creaNumeroEffetto(valore)
   print ("valore :" .. valore )
    local num1,num2
    local char1=valore:sub(0,1)
    local char2= valore:sub(2,2)
    print (char1)
    print (char2)
if char2 == "" then
    num1=  display.newImage(composer.imgDir .. char1 .. ".png" ,rectEffetti.x ,rectEffetti.y)
    num2=nil
    print("case1")
else
     print("case2")
    num1=  display.newImage(composer.imgDir .. char1 .. ".png" ,rectEffetti.x - 11 ,rectEffetti.y)
    num2= display.newImage(composer.imgDir .. char2 .. ".png" ,rectEffetti.x + 11 ,rectEffetti.y)
    num2.width=45
    num2.height= 45
end
num1.width=45
num1.height= 45
testoVolumeEffettoSonoro={fn=num1,sn=num2}
end



local pausa = {}
pausa = LD_Loader:new(gruppoPausa)
pausa:loadLevel("schermat_pausa_level")
immagine_pausa = pausa:getLayerObject("pulsanti", "finestra_pausa_0").view
print("messa pausa " .. mod_par)

rectMusica = pausa:getLayerObject("pulsanti", "rect_9").view
rectEffetti = pausa:getLayerObject("pulsanti", "rect_8").view

creaNumeroMusica(tostring((partitaS:volumeMusica() * 10)))
creaNumeroEffetto(tostring((partitaS:volumeEffettoSonoro() * 10)))

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

   testoVolumeMusica.fn:removeSelf()
    testoVolumeMusica.fn= nil
    if ( testoVolumeMusica.sn ~= nil) then
    testoVolumeMusica.sn:removeSelf()
    testoVolumeMusica.sn= nil
end
testoVolumeEffettoSonoro.fn:removeSelf()
    testoVolumeEffettoSonoro.fn= nil
    if ( testoVolumeEffettoSonoro.sn ~= nil) then
    testoVolumeEffettoSonoro.sn:removeSelf()
    testoVolumeEffettoSonoro.sn= nil
end
gruppoPausa:removeSelf() print("tolto da 'ok' - tower") tempoFinePausa=os.time() --rimuove la pausa
tempoPausaTotale = tempoPausaTotale + (tempoFinePausa - tempoInizioPausa)
--print("tempo di pausa totale - tower",tempoPausaTotale)

end)
musicam:addEventListener("tap", onButtonClickUpMusica)
musicap:addEventListener("tap", onButtonClickDownMusica)
fxp:addEventListener("tap", onButtonClickUpEffettoSonoro)
fxm:addEventListener("tap", onButtonClickDownEffettoSonoro)
backtomenu:addEventListener("tap", function()
  numeroPalle = statistiche.numeroPalle
  isPaused=false

  testoVolumeMusica.fn:removeSelf()
    testoVolumeMusica.fn= nil
    if ( testoVolumeMusica.sn ~= nil) then
    testoVolumeMusica.sn:removeSelf()
    testoVolumeMusica.sn= nil
end
testoVolumeEffettoSonoro.fn:removeSelf()
    testoVolumeEffettoSonoro.fn= nil
    if ( testoVolumeEffettoSonoro.sn ~= nil) then
    testoVolumeEffettoSonoro.sn:removeSelf()
    testoVolumeEffettoSonoro.sn= nil
end

    scancellaTutto() --rimuove gruppolivello e cannone
    gruppoPausa:removeSelf() print("tolto da backtomenu - tower")

testoVolumeMusica= nil
testoVolumeEffettoSonoro= nil
    timer.performWithDelay(500, function() composer.gotoScene("toMenu") end )
  end)

end
---------------------------------------------------------------------------------
--FUNZIONE CHE CREA LA SCHERMATA DI STATISTICHE
---------------------------------------------------------------------------------
 function creaStatistiche()
  local images={}

local function creaScritta(valore,y)

  for i = 1, #valore do
    local c = valore:sub(i,i)
   -- print(c)
    -- do something with c
    local num = display.newImage(composer.imgDir .. c .. ".png" , (200 + i*23) ,y)
    num.width= 45
    num.height= 45
    table.insert(images, num)
  end
end

local schermataStatistiche = display.newImageRect("images/stat window.png" ,320,480)
      schermataStatistiche.x = _W/2 schermataStatistiche.y = _H/2
      local chiudi = display.newRect( 238,420, 75,75 )
      chiudi.alpha = 0.01
      print("messe statistiche " ..  mod_par)
      local stats = partitaS:stats()
      print(stats.danno)
       print(stats.numeroPalle)
        print(stats.velocita*10)
         print(stats.rimbalzo/10)
          print(stats.grandezza)
           print(stats.densita)
            print(stats.fortuna)

    creaScritta(tostring(stats.danno), 95)
    creaScritta(tostring(stats.numeroPalle), 135)
    creaScritta(tostring(stats.velocita*10), 180)   --max 999? poco spazio
    creaScritta(tostring(stats.rimbalzo), 225) --sennò valore con la virgola
    creaScritta(tostring(stats.grandezza), 267)
    creaScritta(tostring(stats.densita), 310)
    creaScritta(tostring(stats.fortuna), 350)

    chiudi:addEventListener("tap",function(event) for  i = 1, #images do images[i]:removeSelf() end  images = nil isPaused=false physics.start() chiudi:removeSelf() chiudi = nil schermataStatistiche:removeSelf( ) schermataStatistiche=nil end)
end
M.testFunction = testFunction

M.creaCannone = creaCannone
M.getAngle = getAngle
M.shoot = shoot
---------------------------------------------------------------------------------
M.creaLivello = creaLivello
M.removeBrick = removeBrick
M.hit = hit
M.hitMuro = hitMuro
M.touchBg = touchBg
M.touch = touch
M.finePartita = finePartita
M.scancellaTutto = scancellaTutto
M.creaUI = creaUI
return M
