local M = {}
local composer = require( "composer" )
local physics = require ("physics")
require ("lib.partitaStoria")
tapSound2= audio.loadSound("sounds/brickStricked.mp3")
--arcade deve creare invece
local preference = require "lib.preference"
local velx = 200
local vely = 200
local py = 360 --(y effettivo - 50)
local isDefeatedWon

require("lib.LD_HelperX")
require("lib.LD_LoaderX")
local _W = display.contentWidth
local _H = display.contentHeight

math.randomseed(os.time())
math.random(); math.random(); math.random()

local a = 225
local gruppoLivello
local gruppoScena
local pg
_G.fisicaCannone=true
local statistiche                              --=partitaS:stats()
local numeroPalle                              --= statistiche.numeroPalle
print("creazione partita - " .. mod_par)
local led_acceso
local pall_lanciata --= nil
local nTiri
local bg
local mattoni
local daColpire -- vera se la palla deve essere ancora lanciata, false se la palla e' stata lanciata e ha colpito il cannone
turnoPotere = false
isPaused = false
tempoInizioPausa = 0
tempoFinePausa = 0
tempoPausaTotale = 0
tempoInizioLivello = os.time()
local circle
local crimson
local livelloPG

local danno
local lx
local ly


--------------------------------------------------------------------------------
local function onLocalCollision( self, event )
  print("funzione collisione chiamata")
    if ( self.myName == "exp" ) then
        local forcex = event.other.x-self.x
        local forcey = event.other.y-self.y-20
        if(forcex < 0) then
            forcex = 0-(80 + forcex)-12
        else
            forcex = 80 - forcex+12
        end
      --event.other:applyForce( 0, forcey+150, self.x, self.y )
      event.other:setLinearVelocity(200,1500)
    end
end

local function setBomb ( event )
--if(event.other.name == "ball") then
    exp = display.newCircle( _W/2, 420, 50 )
            exp.myName = "exp"
    exp:setFillColor(0,0,0, 1)
    print("esplosione fatta")
  --  timer.performWithDelay( 200, function()
      physics.addBody( exp, "static", {isSensor = true} )
    -- end)
    exp.collision = onLocalCollision
    exp:addEventListener( "collision", exp )
 timer.performWithDelay( 1, function() exp:removeSelf() exp=nil end )


--end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local function dannoXY(event, mod)
  local rainbowColor= {
    {1,0,0},
    {1,0.5,0},
    {1,1,0},
    {0.5,1,0},
    {0,1,0},
    {0,1,0.5},
    {0,1,1},
    {0,0.5,1},
    {0,0,1},
    {0.5,0,1},
    {1,0,1},
    {1,0,0.5}
  }
  local brickColpiti= {}

  local n1 = math.random(1,12)
  local c1 = rainbowColor[n1]

  local n2 = math.random(1,12)
  local c2 = rainbowColor[n2]

  local n3 = math.random(1,12)
  local c3 = rainbowColor[n3]

  local n4 = math.random(1,12)
  local c4 = rainbowColor[n4]

  local xHit=event.target.x
  local yHit=event.target.y
  local hHit= event.target.height * (event.target.yScale)
  local wHit= event.target.width * (event.target.xScale)

  local asseHitxUp= display.newRect(xHit + 160, yHit, 320, 1 )
  local asseHitxDown= display.newRect(xHit - 160 , yHit, -320, 1 )
  local asseHityUp= display.newRect(xHit, yHit + 240, 1, 480 )
  local asseHityDown= display.newRect(xHit, yHit - 240, 1, -480 )

  asseHitxUp:setFillColor(c1[1], c1[2], c1[3])
  asseHitxDown:setFillColor(c2[1], c2[2], c2[3])
  asseHityUp:setFillColor(c3[1], c3[2], c4[3])
  asseHityDown:setFillColor(c4[1], c4[2], c4[3])

  gruppoScena:insert(asseHitxUp)
  asseHitxUp:toBack()
  gruppoScena:insert(asseHitxDown)
  asseHitxDown:toBack()
  gruppoScena:insert(asseHityUp)
  asseHityUp:toBack()
  gruppoScena:insert(asseHityDown)
  asseHityDown:toBack()

  --print ("x ".. xHit)
  --print ("y ".. yHit)
  --print ("h ".. hHit)
  --print ("w ".. wHit)
  --print ("*****************************************°°°******")
  for i=1, #mattoni do  --ancoraggio mattoni x e y su 0.5
    if (mattoni[i].x ~= nil)  then
  --print ("x ".. mattoni[i].x)
  --print ("y ".. mattoni[i].y)
  --print ("w ".. mattoni[i].width * (mattoni[i].xScale))
  --print ("h ".. mattoni[i].height * (mattoni[i].yScale))
      local larghezza= mattoni[i].width * (mattoni[i].xScale)
      local altezza= mattoni[i].height * (mattoni[i].yScale)
     if --(((yHit - (hHit/2)) <= (mattoni[i].y + (mattoni[i].height/2))) or ((yHit + (hHit/2)) >= (mattoni[i].y - (mattoni[i].height/2))) )
     ((xHit >= (mattoni[i].x - (larghezza/2))) and (xHit <= (mattoni[i].x + (larghezza/2))))  --controllo sulla y
       or ((yHit >= (mattoni[i].y - (altezza/2))) and (yHit <= (mattoni[i].y + (altezza/2))))
     then
      local brick_colpito = display.newImageRect("images/hitten-brick.png",30,50)
      brick_colpito.x = mattoni[i].x
      brick_colpito.y = mattoni[i].y
      if mattoni[i].name == 'speciale' then
        potereAttivato = true
        led_acceso.alpha=1
  end
  --if event.target.name == "static part ui_0" then print('funziona') end
  --physics.setGravity( 0, 46 )
  if partitaS:stats().danno > 1 then
      mattoni[i].life = mattoni[i].life - (math.floor(partitaS:stats().danno/2))
    else
      mattoni[i].life = mattoni[i].life - 1
    end

      if mattoni[i].life <= 0 then
               removeBrick(mattoni[i], mod)
             else
              mattoni[i].scritta.text = mattoni[i].life
             --brick.alpha = (brick.life/(5*100))*50
             end
        timer.performWithDelay( 100, function() brick_colpito.alpha = 0 end )
   end
 end
end

         timer.performWithDelay( 100, function()
          gruppoScena:remove(asseHitxUp)
          asseHitxUp:removeSelf()
          asseHitxUp.alpha = 0
          gruppoScena:remove(asseHitxDown)
          asseHitxDown:removeSelf()
          asseHitxDown.alpha = 0
          gruppoScena:remove(asseHityUp)
          asseHityUp:removeSelf()
          asseHityUp.alpha = 0
          gruppoScena:remove(asseHityDown)
          asseHityDown:removeSelf()
          asseHityDown.alpha = 0

          end )

end
--------------------------------------------------------------------------------
--print ("modalità in funzioni " .. mod_par .. "*********************************************************************************")
function creaPartita()
if mod_par=="arcade" then
partitaS:new()
end
danno = partitaS:stats().danno
 statistiche=partitaS:stats()
 numeroPalle = statistiche.numeroPalle
--print("creazione partita - creaPartita " .. mod_par)
 pall_lanciata = nil
isPaused = false
tempoInizioPausa = 0
tempoFinePausa = 0
tempoPausaTotale = 0
tempoInizioLivello = os.time()
isDefeatedWon= false
end

local function nebulaCollide( self,event )
    -- Query the position (and state) from "shieldStates" table
    if daColpire then
        event.contact.isEnabled = false daColpire=false end -- Use physics contact to void collision
        --self:removeEventListener("nebulaCollide",preCollision)
end

local vecchiaPalla
 function creaCannone(cannon,cerchio)
  creaPartita()
  nTiri=0
  --print("numero palle = " .. statistiche.numeroPalle .. mod_par)
  numeroPalle = statistiche.numeroPalle

   gruppoLivello = display.newGroup( )

   circle = display.newCircle( _W/2, 60, 40 ) --cerchio del pg
   gruppoLivello:insert(circle)
   circle:toFront( )
   circle:setFillColor(0,0,0)
   livelloPG = LD_Loader:new(gruppoLivello)
   livelloPG:loadLevel("personaggi." .. partitaS:personaggio())
   pg = livelloPG:getLayerObject("Layer 1", partitaS:personaggio() ).view
   if partitaS:personaggio() == "cottonBall" then
   -- print("aaaaaaaaaaaaaaaaaaaaaaaaaaaassssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
   pg.x = _W/2
   pg.y= 60
 elseif partitaS:personaggio() == "crimson" then
  crimson= pg
  pg.x = _W/2 + 3
  pg.y= 45
 end
  -- print("FDHSKJFS pg.w " , pg.width .. " pg.h" , pg.height)
 --  pg.width = a
 --  pg.height = a
  -- print("il frame e " , pg.frame)
    _G.canShoot = true
    _G.potereAttivato = false
    _G.numBallMax = partitaS:stats().numeroPalle
  display.setDefault( "isAnchorClamped", false )
  cannon.x = _W/2
    cannon.y = 60  --50
    cannon.anchorY = 0.33
    cerchio.view.x = cannon.x cerchio.view.y=60

cannon.preCollision = nebulaCollide
cannon:addEventListener( "preCollision", cannon )

      --print(  "FDJSPOFKSDPOODFJKSPOKFDSPKTest function called")
      local rect = display.newRect( 0, _H/2,50,50 )
      rect:addEventListener( "tap", function() physics.setDrawMode( "hybrid" ) fisicaCannone=true potereAttivato=true preference.save{b="500"}
value = preference.getValue("b")
print("Retrieving string b from rect: ",value)  end)
      local rect1 = display.newRect( 0, _H/2 +50,50,50 )
      rect1:addEventListener( "tap", function() physics.setDrawMode( "hybrid" ) fisicaCannone=false value = preference.getValue("b")
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
  --print("numeroPalle = " .. numeroPalle)
  numeroPalle= numeroPalle -1
  physics.start()
    if numeroPalle>0 then
  obj = myUI:getLayerObject("ui_layer", "ball_"..string.format(numeroPalle-1)).view
  obj:setLinearVelocity(150,0)
  --print("obj = ",obj)
  vecchiaPalla= obj else  canShoot=false
  end
  end
---------------------------------------------------------------------------------
-- FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
---------------------------------------------------------------------------------
  function getAngle(sx,sy,cannon) --FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
         local angolo
         lx= sx
         ly=sy
         sy= sy - 60
         local latoVerticale = sy
         local latoObliquo = math.sqrt(math.pow((display.contentWidth/2 - sx),2)+math.pow(( - sy),2))
         angoloRad = (math.acos(latoVerticale/latoObliquo))  --radianti
         angolo= ((angoloRad*180)/3.14)
         if (sx < display.contentWidth/2) then
          if angolo>= 90 then
            cannon.rotation = 90
          else
         cannon.rotation = angolo
       end
       else
         if angolo>= 90 then
            cannon.rotation = -90
          else
        cannon.rotation = -angolo
      end
      end
       end --FINE FUNZIONE PER IL CALCOLO DELL'ANGOLO DI ROTAZIONE
---------------------------------------------------------------------------------
-- FUNZIONE PER CREAZIONE PALLA
---------------------------------------------------------------------------------
function listenerUltimaPalla(event)
	if not isPaused then
	if not(pall_lanciata==nil) then
   if pall_lanciata:getLinearVelocity()~=nil
    then vx,vy = pall_lanciata:getLinearVelocity( ) end
  if vy<0 then vy=-vy end
  if vx<0 then vx=-vx end
  if (pall_lanciata.y > py and vy <vely and vx < velx) then --qui
    finePartita()
    Runtime:removeEventListener("enterFrame", listenerUltimaPalla)
  end end
end end

function listenerPallaSpeciale(event)
	if not isPaused then
   if pall_lanciata:getLinearVelocity()~=nil
    then vx,vy = pall_lanciata:getLinearVelocity( ) end
  if vy<0 then vy=-vy end
  if vx<0 then vx=-vx end
--  if (pall_lanciata.y > 450 and (pall_lanciata.x>135 and pall_lanciata.x<205) and vy <100 and vx < 10) then --qui
    if (pall_lanciata.y > py and vy <vely and vx < velx) then

    setBomb()
    Runtime:removeEventListener("enterFrame", listenerPallaSpeciale)
  end
end end

       function creaPalla(sx,sy,potereAttivato, angolo)
        --turnoPotere= false da rimettere
        turnoPotere = false
        local sy= sy - 60
        if numBallMax == 0 then
     Runtime:addEventListener("enterFrame", listenerUltimaPalla)
   end
        if potereAttivato then
           if partitaS:personaggio()=="crimson" then
            crimson:setFillColor(1,0,0)
             partitaS:stats().danno = 10
             livello= LD_Loader:new(gruppoLivello)
             livello:loadLevel("fireBall")
             x= ball.x 
             y= ball.y
             ancoraggio= ball.anchorY

             ball= livello:getLayerObject("Layer 1", "16_sunburn_spritesheet_0").view
             ball.x= x 
             ball.y= y
             physics.addBody(ball, 'static' , {radius=partitaS:stats().grandezza/2,bounce=((partitaS:stats().rimbalzo)/100),friction=0.3,density=(partitaS:stats().densita)/10})
            --  ball = display.newImageRect("images/PallaSpeciale"..partitaS:personaggio()..".png", partitaS:stats().grandezza, partitaS:stats().grandezza)
           

            --circle:setFillColor(0.66, 0.29, 0.38)
         else crimson = nil 
        	pg:play() --pg.width = a pg.height = a
   ball = display.newImageRect("images/PallaSpeciale"..partitaS:personaggio()..".png", partitaS:stats().grandezza, partitaS:stats().grandezza)
   end
   if partitaS:personaggio() == "crimson" and potereAttivato then
   Runtime:addEventListener("enterFrame", listenerPallaSpeciale)
   end
   turnoPotere= true

  -- partitaS:stats().danno = 10
   --physics.addBody(ball, 'static' , {radius=7.5,bounce=0.8,friction=0.3})
  else
    --crimson= nil
    --crimson = livelloPG:getLayerObject("Layer 1", partitaS:personaggio() ).view
if partitaS:personaggio()=="crimson" then
    crimson:setFillColor(1,1,1)
    circle:setFillColor(0,0,0)
    crimson.x = _W/2 + 3
    crimson.y= 45
    end
    ball = display.newImageRect("images/default ball.png", partitaS:stats().grandezza,partitaS:stats().grandezza)
    --partitaS:stats().grandezza, partitaS:stats().grandezza)
--print("palla di grandezza" .. partitaS:stats().grandezza)

    partitaS:stats().danno = danno
        end
    ball.x  = display.contentWidth/2
    ball.y = 60 -- 130
    --print("stampe") print(angolo) print(72.5/ball.contentHeight)
    --grandezza arcade raggio 15 tower 10
    ball.anchorY= -(4.83 + 0.30* (15 - partitaS:stats().grandezza)) --4,83
    ball.anchorX= 0.5--72.5/ball.contentWidth
    ball.rotation=  angolo
    if potereAttivato then
    physics.addBody(ball, 'static' , {radius=partitaS:stats().grandezza/2,bounce=((partitaS:stats().rimbalzo)/100),friction=0.3,density=(partitaS:stats().densita)/10})
else physics.addBody(ball, 'static' , {radius=partitaS:stats().grandezza/2,bounce=((partitaS:stats().rimbalzo)/100),friction=0,density=(partitaS:stats().densita)/10}) end
   -- ball.density= 0.73
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
       --physics.setGravity(0, 46) --modificare
       ball:setLinearVelocity( normDeltaX*speed,normDeltaY*speed )
       pall_lanciata = ball
       gruppoLivello:insert(pall_lanciata)
       nTiri = nTiri + 1
       --ball.preCollision = nebulaCollide
      -- ball:addEventListener( "preCollision", ball )
end
---------------------------------------------------------------------------------
-- FUNZIONE DI SHOOTING
---------------------------------------------------------------------------------
  function shoot(event,potereAttivato,cannon)
  -- if (numBallMax) < 0 then

  --   finePartita()
  -- else
  if canShoot then
    numBallMax = numBallMax - 1
    caricaPalla()
    daColpire=true
    --print("cannon:shoot",potereAttivato)
   -- sx,sy= event.x , event.y
   -- getAngle(sx,sy,cannon)
   if lx == nil then
    lx= event.x
  end
  if ly== nil then
    ly= event.y
  end
  cannon:play()

 
  local ball 
 -- if ball and not ball.isLaunched then
    ball = creaPalla(lx,ly,potereAttivato, cannon.rotation)

  canShoot = false 
  --  ball:launch()
    end
  end
---------------------------------------------------------------------------------
-- FUNZIONI LIVELLO
---------------------------------------------------------------------------------
function creaLivello(cannon, objMattoni)
  physics.setGravity(0, 46)
mattoni = objMattoni
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
     if(mod_par=="arcade") then
		partitaS:cancellaPersonaggio()
	end
     schermataVittoria()
   --DA SISTEMARE

end end


local function onButtonClick(event)
  print("bottone vinto tappato")
  local options = { effect = "crossFade", time = 200, params = {
    livelloCompletato = true
    }}
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
	--print("stampa schermata")
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
  --print ("is turno potere")
  --print (turnoPotere)

  if turnoPotere == true and partitaS:personaggio() == "cottonBall" then
   -- print ("hgghghg"..event.target.x)
    dannoXY(event, mod)
  end

  local brick_colpito = display.newImageRect("images/hitten-brick.png",30,50)
  brick_colpito.x = event.target.x
  brick_colpito.y = event.target.y
  if event.target.name == 'speciale' then
    --setBomb()  potere esplosione
   -- dannoXY()
    potereAttivato = true
    led_acceso.alpha=1
    end
    --print("coplito")
  -- if event.target.name == "static part ui_0" then print('funziona') end
--  physics.setGravity( 0, 46 )
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
         -- end
           end
---------------------------------------------------------------------------------
--FUNZIONI TOUCH AUSILIARIE
---------------------------------------------------------------------------------
 function touchBg(event,cannon)
   print("evento x= " .. event.x .. " y= " .. event.y)
 -- if isPaused ==false then physics.start() end
 if pall_lanciata~=nil  then print("palla lanciata x=,y=",pall_lanciata.x,pall_lanciata.y) end
 print("canShoot",canShoot)
 print("isPaused",isPaused)
 local timeBegan
 if event.phase == 'began' then
  timeBegan = event.time
  -- print ("time began" .. timeBegan)
end

 physics.start( )
 if nTiri==0 then canShoot = true else
 if event.phase == 'began' then
 if pall_lanciata~=nil  then
  if pall_lanciata:getLinearVelocity()~=nil
    then vx,vy = pall_lanciata:getLinearVelocity( ) end
  if vy<0 then vy=-vy end
  if vx<0 then vx=-vx end
 --print("ge".. pall_lanciata.y .." " .. vy)
else-- print("primto tmiro")
 end




  if ((pall_lanciata==nil or (pall_lanciata.y > py and vy < vely and vx < velx)) and
      numeroPalle>0) then
      if pg.isPlaying then pg:pause() pg:setFrame(1) end
   canShoot = true 
 end
end --event.phase
end -- if nTiri

--canShoot = true --da cancellare dopo

      if not isPaused then

      if  --((event.phase == 'began') and (os.time() >= timeBegan + 500)) or  spostati dopo un po' che stai con il dito sullo stesso punto
        event.phase == 'moved' or ((event.phase == 'ended') and
        (not (event.x == event.xStart and event.y== event.yStart))) then --event.phase == 'began'
        getAngle(event.x,event.y,cannon)
      elseif event.phase == 'ended' and canShoot
      and event.x == event.xStart and event.y== event.yStart --tap
      -- and ((event.time >= timeBegan ) and (event.time <= timeBegan + 200))
      then
      --print ("tempo evento" .. event.time)
      
      --print("numero palle" .. numBallMax)
      if canShoot == true then 

        timer.performWithDelay(225, function() 
          shoot(event,potereAttivato,cannon) 
          led_acceso.alpha=0
      potereAttivato=false
      canShoot=false
          end)
      
       --tempr mettere true per sparare sempree

      end 
      end -- if palla lanciata ecc
          end

        end
---------------------------------------------------------------------------------
--FUNZIONE TOUCH
---------------------------------------------------------------------------------
 function touch(event,cannon)
  if not isPaused then
    if event.target.name == "bg" then
      if not((event.x <60  and event.y > 415) or (event.x > 270 and event.y > 415) or (event.y > 460) ) then
      touchBg(event,cannon) end end
    end end
---------------------------------------------------------------------------------
--FUNZIONE FINE PARTITA
---------------------------------------------------------------------------------
 function finePartita()
  crimson= nil
  livelloPg= nil
    if mod_par=="tower" then
  partitaS:aggiungiscore(500,(os.time() - tempoInizioLivello) - tempoPausaTotale, numBallMax,true)
end
if nil~= composer.getScene("levels.mappa") then composer.removeScene("levels.mappa", false) end
--partitaS:new()
preference.save{tower=123}
partitaS:cancellaPersonaggio()
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
  gruppoScena= screenGroup
  _G.myUI = LD_Loader:new(screenGroup)
  myUI:loadLevel("ui.ui")
  led_acceso = display.newImageRect("images/led acceso.png",  30,30 )
  gruppoLivello:insert(led_acceso)
  	for i=16,26 do
  local rectCentrale = myUI:getLayerObject("ui_layer", "rect_"..i ).view
  rectCentrale:addEventListener("collision",function(event) local vx, vy = event.other:getLinearVelocity() vx = vx/2 vy = vy/2 event.other:setLinearVelocity(vx,vy) end)
   end
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
--print("creaGruppo - tower")
  return gruppo
end
---------------------------------------------------------------------------------
--FUNZIONE CHE CREA LA PAUSA
---------------------------------------------------------------------------------
 function creaPausa()
  print ("pg".. partitaS:personaggio() )
      if partitaS:personaggio() == "crimson" then
     Runtime:removeEventListener("enterFrame", listenerPallaSpeciale)
   end
     Runtime:removeEventListener("enterFrame", listenerUltimaPalla)
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
    --print ("valore :" .. valore )
    local num1,num2
    local char1=valore:sub(0,1)
    local char2= valore:sub(2,2)
    --print (char1)
    --print (char2)
if char2 == "" then
    num1=  display.newImage(composer.imgDir .. char1 .. ".png" ,rectMusica.x ,rectMusica.y)
    num2=nil
    --print("case1")
else
     --print("case2")
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
  --physics.setGravity(0,46)
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
	if(mod_par=="arcade") then
		partitaS:cancellaPersonaggio()
	end
  numeroPalle = statistiche.numeroPalle
  partitaS:stats().danno=danno
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
        print(stats.velocita*100)
         print(stats.rimbalzo/100)
          print(stats.grandezza)
           print(stats.densita/10)
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
M.touchBg = touchBg
M.touch = touch
M.finePartita = finePartita
M.scancellaTutto = scancellaTutto
M.creaUI = creaUI
return M
