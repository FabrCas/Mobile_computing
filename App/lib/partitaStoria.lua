--dati della partita in modalità storia

local personaggio
local stats
--local prossimolivello
local livelloAttuale
local livelli --table dove verranno salvati tutti i livelli per piano
local score
local prova="gianna"
local torre
local piano -- var di appoggio per la creazione della torre
local preference = require "lib.preference"
local volumeMusica = 0.5
local volumeEffettoSonoro = 0.5
--local tipiStanza= {"normale", "tesoro", "uscita"}

math.randomseed(os.time())
math.random(); math.random(); math.random() -- per stabilizzare i primi valori di random


partitaS = {}
partitaS_mt =  {__index = partitaS}

function partitaS:new()

  print("creata partitaS - " .. mod_par .. "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
   if mod_par=='tower' then
  livelloAttuale= "/scene01"
  score=0
  stats = {
    danno= preference.getValue("danno"), --1
    numeroPalle= preference.getValue("numeroPalle"), --8
    velocita= preference.getValue("velocita"), --500
    rimbalzo= preference.getValue("rimbalzo"),--0.8
    grandezza= preference.getValue("grandezza"), --diametro 10  --la massa è data dalla grandezza dell'oggetto e dalla sua densità (object.mass per vederla)
    densita= preference.getValue("densita"), --1
    fortuna= preference.getValue("fortuna")  --statistica da sommare a favore o no (se negativa) ai calcoli randomici [minimo: -5, massimo: +5] 
  }
    print("torre - tower")
    print("valore tower", preference.getValue("tower"))
    if preference.getValue("tower")==123 then
      print("tower si crea")
  torre= {}
  preference.save{score="gianna"}
  torre.pianoAttuale= 0
  piano={}
  piano.altezza=0
  creazioneTorre()
  torre.stanzaAttuale= torre.primoPiano.start
  preference.save{tower=torre} else
    print("esiste tower quindi non viene creata")
    torre=preference.getValue("tower")end
else
  print ("arcade - arcadeEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
    livelloAttuale= "/scene01"
  score=0
  stats = {
    danno= 5,
    numeroPalle= 12,
    velocita= 5, --fare * 100 
    rimbalzo= 80,   --fare fratto 100 poi (valori da 0 a 1 )
    grandezza= 15, --diametro   --la massa è data dalla grandezza dell'oggetto e dalla sua densità (object.mass per vederla)
    densita= 5, --fratto 10 
    fortuna= 0  --statistica da sommare a favore o no (se negativa) ai calcoli randomici [minimo: -5, massimo: +5]
  }
end  end



-- inizio funzioni per la creazione della mapppa




--buffer livelli 30, 10 per piano
--10 al primo , 10 al secondo, 10 al terzo
--numero stanze:
--min:5 max:8
--min:8 max:11
--min:11 max:15
--convenzioni: 1->nord 2->est 3->sud 4->ovest
--tipi di stanza_ normale, tesoro, uscita (tesoro scala con la fortuna)

function creazioneTorre()
  if piano.altezza < 3 then --da  cancellare
--print ("******************************************inizio creazione piano ********************************************************")
    local pianoCartesianoStanze= {} -- coppie (x,y) utilizzate per la corretta
    --toNord -> (-, +1)
    --toEst -> (+1, -)
    --toSud -> (-, -1)
    --toOvest -> (-1, -)
    local inizio

   --*******************************************************************************************************************
math.randomseed(os.time())
math.random(); math.random(); math.random()
--***************************************************************************************************************************

    --inizializzazione piano con la prima stanza
    if (piano.altezza==0) then
    inizio = math.random(1, 10);
    piano.nStanze= math.random(5,8)
    elseif(piano.altezza==1) then
    inizio = math.random(10, 20);
    piano.nStanze= math.random(8,11)
    else
    inizio = math.random(20, 30);
    piano.nStanze= math.random(11,15)
    end

    local stanza= {}
    stanza.isLocked = false
    stanza.isCompleted = false
    stanza.coordinate= {}
    stanza.coordinate.x=0
    stanza.coordinate.y=0
    stanza.tipo= "normale"
    table.insert(pianoCartesianoStanze, stanza.coordinate)
    listaCreazione= {} --lista di stanze su cui andrà effettuato la chiamata di creazione stanze
    stanza.nome = "scene"..string.format(inizio);
    piano.start= stanza
    local stanzeRimaste= piano.nStanze --ho creato la stanza iniziale, quindi -1

   -- print("numero stanze di partenza: "..string.format(stanzeRimaste))
   -- print("stanza iniziale: ".. stanza.nome)
    stanzeRimaste= (piano.nStanze - 1) --ho creato la stanza iniziale, quindi -1
    local delta=0 --variabile che evita il blocco nella creazione delle stanza

--variabili per evitare di creare più stanze nella stessa direzione
    local nordSorteggiato= false
    local estSorteggiato= false
    local sudSorteggiato= false
    local ovestSorteggiato= false

   --*******************************************************************************************************************
math.randomseed(os.time())
math.random(); math.random(); math.random()
--***************************************************************************************************************************

--creazione stanze
    for i=1, 4 do
      esisteStanza= math.random((1+ delta),4)  --delta ci assicura che almeno una stanza verrà creata per la stanza di partenza, nella quarta iterazione

     --print("---------------------")
     --print ("iterazione: "..string.format(i))
     --print (esisteStanza==4)


      if esisteStanza==4 then
      local direzione= math.random(1,4)
      local stanzaSorteggiata
      if (piano.altezza==0) then
    stanzaSorteggiata = math.random(1, 10);
    elseif(piano.altezza==1) then
    stanzaSorteggiata = math.random(10, 20);
    else
    stanzaSorteggiata = math.random(20, 30);
    end

      local stanzaTemp = {}
      stanzaTemp.coordinate={}
      stanzaTemp.isLocked= true
      stanzaTemp.isCompleted = false
      local coordinateUtilizzate= {}

      stanzaTemp.nome= "scene"..string.format(stanzaSorteggiata)
      sorteggioStanzaTesoro = math.random(1,2)  --1,6
      if (sorteggioStanzaTesoro==2) then
        stanzaTemp.tipo= "tesoro"
      else
      stanzaTemp.tipo= "normale"
    end


      --print ("direzione: "..direzione)
      --print ("stanza sorteggiata: "..stanzaSorteggiata)
      --print("---------------------")

      if direzione==1 then
        if (not nordSorteggiato) then
        stanzaTemp.coordinate.x = stanza.coordinate.x
        stanzaTemp.coordinate.y = (stanza.coordinate.y + 1)
        stanza.nord= stanzaTemp
        coordinateUtilizzate.x= stanza.coordinate.x
        coordinateUtilizzate.y= (stanza.coordinate.y + 1)
        table.insert(pianoCartesianoStanze, coordinateUtilizzate)
        table.insert(listaCreazione, stanza.nord)
        nordSorteggiato= true
        stanzeRimaste = stanzeRimaste -1
      end
      elseif direzione==2 then
        if (not estSorteggiato) then
        stanzaTemp.coordinate.x = (stanza.coordinate.x + 1)
        stanzaTemp.coordinate.y = stanza.coordinate.y
        stanza.est= stanzaTemp
        coordinateUtilizzate.x= (stanza.coordinate.x + 1)
        coordinateUtilizzate.y= stanza.coordinate.y
        table.insert(pianoCartesianoStanze, coordinateUtilizzate)
        table.insert(listaCreazione, stanza.est)
        estSorteggiato= true
         stanzeRimaste = stanzeRimaste -1
      end
      elseif direzione== 3 then
        if (not sudSorteggiato) then
        stanzaTemp.coordinate.x = stanza.coordinate.x
        stanzaTemp.coordinate.y = (stanza.coordinate.y -1)
        stanza.sud = stanzaTemp
        coordinateUtilizzate.x= stanza.coordinate.x
        coordinateUtilizzate.y= (stanza.coordinate.y -1)
        table.insert(pianoCartesianoStanze, coordinateUtilizzate)
        table.insert(listaCreazione, stanza.sud)
        sudSorteggiato = true
        stanzeRimaste = stanzeRimaste -1
      end
      else
        if (not ovestSorteggiato) then
        stanzaTemp.coordinate.x = (stanza.coordinate.x -1)
        stanzaTemp.coordinate.y = stanza.coordinate.y
        stanza.ovest= stanzaTemp
        coordinateUtilizzate.x= (stanza.coordinate.x -1)
        coordinateUtilizzate.y= stanza.coordinate.y
        table.insert(pianoCartesianoStanze, coordinateUtilizzate)
        table.insert(listaCreazione, stanza.ovest)
        ovestSorteggiato= true
        stanzeRimaste = stanzeRimaste -1
      end
      end
    end
    delta= delta+1
  end

--stampe prova
if (stanza.nord ~= nil) then
--print (stanza.nord.nome)
end
if (stanza.est ~= nil) then
--print (stanza.est.nome)
end
if (stanza.sud ~= nil) then
--print (stanza.sud.nome)
end
if (stanza.ovest ~= nil) then
--print (stanza.ovest.nome)
end

--print("numero stanze dopo la prima creazione: "..string.format(stanzeRimaste))
--print ("coordinate utilizzate:")
for i=1, #pianoCartesianoStanze do
 -- print (string.format(pianoCartesianoStanze[i].x).." "..string.format(pianoCartesianoStanze[i].y))
end
--print("prossime stanze nella creazione:")
for i=1, #listaCreazione do
--  print (string.format(listaCreazione[i].nome))
end

--------------------------------crazione altre stanze
local ricorsioneN = 1
creaStanze(stanzeRimaste, pianoCartesianoStanze, listaCreazione, ricorsioneN, piano.nStanze)
-----------------------------------------------------

for i=1, #pianoCartesianoStanze do
 -- print (string.format(pianoCartesianoStanze[i].x).." "..string.format(pianoCartesianoStanze[i].y))
end

altezza= piano.altezza
if (piano.altezza== 0) then
torre.primoPiano= piano
--print("avvio stampa di prova per piano: ".. string.format(piano.altezza))
bufferStampa= {}
stampaPiano(torre.primoPiano.start, 0,bufferStampa)
elseif (piano.altezza==1) then
  torre.secondoPiano= piano
  --print("avvio stampa di prova per piano: ".. string.format(piano.altezza))
bufferStampa= {}
stampaPiano(torre.secondoPiano.start, 0,bufferStampa)
else
  torre.terzoPiano= piano
   --print("avvio stampa di prova per piano: ".. string.format(piano.altezza))
bufferStampa= {}
stampaPiano(torre.terzoPiano.start, 0,bufferStampa)
end

piano=nil
piano={}
piano.altezza= altezza +1
print ("***************************************fine creazione piano ********************************************************")
creazioneTorre()
 else
  return true
end
end



function creaStanze(stanzeRimaste, coordinateStanze, listaCreazione, numero, stanzeTotali) --stanze rimanenti è un numero
 -- print("***************************/////*******************")
 -- print ("ciclo di creazione: "..numero)

local stanzeRimanenti=stanzeRimaste
local pianoCartesiano= coordinateStanze
local bufferCreazione= listaCreazione
--print ("stanze rimaste: ".. stanzeRimanenti)
valori_buffer= (#listaCreazione - numero)
--print ("numero buffer: ".. valori_buffer)
num= numero

if stanzeRimanenti > 0  then --and valori_buffer>0 then
  local stanza= bufferCreazione[num]  --risolvere problema buffer vuoto

--print (stanza.coordinate.x)
--print (stanza.coordinate.y)
  delta = 0
  --variabili per evitare di creare più stanze nella stessa direzione
    local nordSorteggiato= false
    local estSorteggiato= false
    local sudSorteggiato= false
    local ovestSorteggiato= false

  if ((math.abs(stanza.coordinate.x) <3) and  (math.abs(stanza.coordinate.y) <3))   then

  for i=1, 4 do

    local CreazioneEseguita= false
    esisteStanza= math.random((1+ delta),4)
    -- print("---------------------")
    --  print ("iterazione: "..string.format(i))
    --  print (esisteStanza==4)

 -- if math.abs(stanza.coordinate.x) <=3 and  math.abs(stanza.coordinate.y) <=3 then
    if esisteStanza==4 then

      local direzione= math.random(1,4)
      local stanzaSorteggiata    --= math.random(1,10)

    if (piano.altezza==0) then
    stanzaSorteggiata = math.random(1, 10);
    elseif(piano.altezza==1) then
    stanzaSorteggiata = math.random(10, 20);
    else
    stanzaSorteggiata = math.random(20, 30);
    end

      local stanzaTemp = {}
      stanzaTemp.coordinate={}
      local coordinateUtilizzate= {}

      --print ("direzione: "..direzione)
      --print ("stanza sorteggiata: "..stanzaSorteggiata)
      --print("**********verifica stanza**************|")
--
      stanzaTemp.nome= "scene"..string.format(stanzaSorteggiata)
      stanzaTemp.isLocked = true
      stanzaTemp.isCompleted = false
      sorteggioStanzaTesoro =  math.random(1,4) 
      if (sorteggioStanzaTesoro==2) then
        stanzaTemp.tipo= "tesoro"
      else
      stanzaTemp.tipo= "normale"
    end

      if direzione==1 then
        coordinateUtilizzate.x= stanza.coordinate.x
        coordinateUtilizzate.y= (stanza.coordinate.y + 1)
       --print ("is valida:")
       --print ((not sudSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0))
        if ((not nordSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0)) then
        stanzaTemp.coordinate.x= coordinateUtilizzate.x
        stanzaTemp.coordinate.y= coordinateUtilizzate.y
        if(stanzeRimanenti == 1)then
          stanzaTemp.tipo ="uscita"
        end
        stanza.nord= stanzaTemp
        table.insert(pianoCartesiano, coordinateUtilizzate)
        table.insert(bufferCreazione, stanza.nord)
        nordSorteggiato= true
        CreazioneEseguita= true
        --print("stanze decrementate")
        stanzeRimanenti = stanzeRimanenti -1

      end
      elseif direzione==2 then
        coordinateUtilizzate.x= (stanza.coordinate.x + 1)
        coordinateUtilizzate.y= stanza.coordinate.y
      -- print ("is valida:")
      -- print ((not sudSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0))
        if ((not estSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0)) then
        stanzaTemp.coordinate.x= coordinateUtilizzate.x
        stanzaTemp.coordinate.y= coordinateUtilizzate.y
         if(stanzeRimanenti == 1)then
          stanzaTemp.tipo ="uscita"
        end
        stanza.est= stanzaTemp
        table.insert(pianoCartesiano, coordinateUtilizzate)
        table.insert(bufferCreazione, stanza.est)
        estSorteggiato= true
        CreazioneEseguita= true
        --print("stanze decrementate")
         stanzeRimanenti = stanzeRimanenti -1
      end
      elseif direzione== 3 then
        coordinateUtilizzate.x= stanza.coordinate.x
        coordinateUtilizzate.y= (stanza.coordinate.y -1)
      -- print ("is valida:")
      -- print ((not sudSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0))
        if ((not sudSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0)) then
        stanzaTemp.coordinate.x= coordinateUtilizzate.x
        stanzaTemp.coordinate.y= coordinateUtilizzate.y
         if(stanzeRimanenti == 1)then
          stanzaTemp.tipo ="uscita"
        end
        stanza.sud = stanzaTemp
        table.insert(pianoCartesiano, coordinateUtilizzate)
        table.insert(bufferCreazione, stanza.sud)
        sudSorteggiato = true
        CreazioneEseguita= true
        --print("stanze decrementate")
        stanzeRimanenti = stanzeRimanenti -1
      end
      else
        coordinateUtilizzate.x= (stanza.coordinate.x -1)
        coordinateUtilizzate.y= stanza.coordinate.y
      -- print ("is valida:")
      -- print ((not sudSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0))
        if ((not ovestSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0)) then
        stanzaTemp.coordinate.x= coordinateUtilizzate.x
        stanzaTemp.coordinate.y= coordinateUtilizzate.y
         if(stanzeRimanenti == 1)then
          stanzaTemp.tipo ="uscita"
        end
        stanza.ovest= stanzaTemp
        table.insert(pianoCartesiano, coordinateUtilizzate)
        table.insert(bufferCreazione, stanza.ovest)
        ovestSorteggiato= true
        CreazioneEseguita= true
      --  print("stanze decrementate")
        stanzeRimanenti = stanzeRimanenti -1
      end
      end
	  end
      delta= delta + 1
      if CreazioneEseguita==false then        --per evitare il caso di buffer vuoto
         table.insert(bufferCreazione, stanza)
       end
  end  --end for
end  --end controllo coordinate non maggiori a 3
else
  return true
end
local newNum= num+1
--table.remove(bufferCreazione, num)
creaStanze(stanzeRimanenti,pianoCartesiano, bufferCreazione, newNum, stanzeTotali)
end


--funzione di appoggio che verifica se una coordinata non è già stata occupata
function verificaCoordinate(coordinate, pianoCartesiano)
  local valoreBooleano= true
  for i=1,#pianoCartesiano do
   if((pianoCartesiano[i].x== coordinate.x) and (pianoCartesiano[i].y==coordinate.y)) then
      valoreBooleano= false
      return valoreBooleano
    end
  end
  return valoreBooleano
end



function stampaPiano(stanza, ricorsiveNumber, buffer)
  if (stanza == nil) then
    return true
  else
 -- print("-----------------@------------------")
 -- print("nome stanza: "..stanza.nome)
 -- print("tipo stanza: "..stanza.tipo)
 -- print("coordinate: ")
 -- print(stanza.coordinate.x)
 -- print(stanza.coordinate.y)
 -- print("è bloccata:")
 -- print(stanza.isLocked)
 -- print("è completata:")
 -- print(stanza.isCompleted)

  if (stanza.nord ~= nil) then
--print ("stanza nord: "..stanza.nord.nome)
table.insert(buffer, stanza.nord)
end
if (stanza.est ~= nil) then
--print ("stanza est: "..stanza.est.nome)
table.insert(buffer, stanza.est)
end
if (stanza.sud ~= nil) then
--print ("stanza sud: "..stanza.sud.nome)
table.insert(buffer, stanza.sud)
end
if (stanza.ovest ~= nil) then
--print ("stanza ovest: "..stanza.ovest.nome)
table.insert(buffer, stanza.ovest)
end

ricorsiveNumber= ricorsiveNumber +1
stampaPiano(buffer[ricorsiveNumber], ricorsiveNumber, buffer)
end
end




-- fine funzioni per la creazione della mapppa



function partitaS:prova()
  print("****************************PartitaCorrettamenteImportato*****************************************************")
end

function partitaS:aggiungiscore(scoreLivello, tempo, palleRimaste, isGameOver)
  print("prova salvataggiooooooooo aggiungiscore()" )
  print(preference.getValue("score"))
  --lo scorelivello è un valore che verrà inviato sia se si ha finito il livello con il gameOver,in quel caso
  --poi verrà chiesto lo score definitivo e stampato a schermo
  --aggiungere un bonus prima di inviare lo score del livello se il giocatore lo ha portato a termine
  local scoreParziale= 0
  scoreParziale = scoreLivello - (tempo) --ogni 5 secondi diminuisce lo score di un valore unitario
  scoreParziale = scoreParziale + (palleRimaste*500)
  if(scoreParziale > 0) then
     if preference.getValue("score")=="gianna" then
  score = score + scoreParziale
else
    score = preference.getValue("score") + scoreParziale
  end
  end
  preference.save{score=score}
end

function partitaS:getScore(scoreLivello, tempo, palleRimaste, isGameOver)
  print("prova salvataggiooooooooo getScore()" )
  print(preference.getValue("score"))
 local scoreParziale= 0
  scoreParziale = scoreLivello - (tempo) --ogni 5 secondi diminuisce lo score di un valore unitario
  scoreParziale = scoreParziale + (palleRimaste*500)
  if preference.getValue("score")=="gianna" then
  return scoreParziale
else
  return scoreParziale + preference.getValue("score")
end
end

function cancellaDatiParitita()

end 




--**************************************Funzioni per ritornare le variabili locali*****************************************************
function partitaS:provaVar()
  return prova
end

function partitaS:stats()
  return stats
end

function partitaS:livello()
  return livello
end

function partitaS:score()
  return score
end

function partitaS:personaggio()
  return personaggio
end

function partitaS:torre()
  return torre
end

function partitaS:volumeMusica()
  return volumeMusica
end

function partitaS:volumeEffettoSonoro()
  return volumeEffettoSonoro
end

--**************************************Funzioni per settare le variabili locali**************************************************************

function partitaS:setPG(pg)
personaggio=pg
end

function partitaS:aumentaVolumeMusica()
  if(volumeMusica<=0.9) then
  volumeMusica= volumeMusica + 0.1
end
end

function partitaS:diminuisciVolumeMusica()
  if(volumeMusica>0.1) then
  volumeMusica= volumeMusica - 0.1
  else
  volumeMusica=0
end
end

function partitaS:aumentaVolumeEffettoSonoro()
  if(volumeEffettoSonoro<=0.9) then
  volumeEffettoSonoro= volumeEffettoSonoro + 0.1
end
end

function partitaS:diminuisciVolumeEffettoSonoro()
  if(volumeEffettoSonoro>0.1) then
  volumeEffettoSonoro= volumeEffettoSonoro - 0.1
else
  volumeEffettoSonoro=0
end
end

function partitaS:cancellaPersonaggio()
personaggio= nil
end 




--************************************Salvataggio dati****************************************************************************************




--info:
--channel musica: 2
--channel effetti sonori: 3
