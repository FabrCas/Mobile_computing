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

math.randomseed(os.time())
math.random(); math.random(); math.random() -- per stabilizzare i primi valori di random


partitaS = {}
partitaS_mt =  {__index = partitaS}

function partitaS:new()
  livelloAttuale= "/scene01"
  score=0
  stats = {
    danno= 1.0,
    numeroPalle= 8,
    rimbalzo= 0.5,
    grandezza= 5.0, --raggio   --la massa è data dalla grandezza dell'oggetto e dalla sua densità (object.mass per vederla)
    densita= 1.0,
    fortuna= 0,  --statistica da sommare a favore o no (se negativa) ai calcoli randomici [minimo: -5, massimo: +5]
    velocita= 500
  }
  torre= {}
  piano={}
  piano.altezza=0
  creazioneTorre()

end

--buffer livelli 30, 10 per piano
--10 al primo , 10 al secondo, 10 al terzo
--numero stanze:
--min:5 max:8
--min:8 max:11
--min:11 max:15
--convenzioni: 1->nord 2->est 3->sud 4->ovest
function creazioneTorre()
 print ("******************************************inizio creazione piano 1 ********************************************************")
  if piano.altezza == 0 then

    local pianoCartesianoStanze= {} -- coppie (x,y) utilizzate per la corretta
    --toNord -> (-, +1)
    --toEst -> (+1, -)
    --toSud -> (-, -1)
    --toOvest -> (-1, -)

    --inizializzazione piano con la prima stanza
    local inizio = math.random(1, 10);
    piano.nStanze= math.random(5,8)
    local stanza= {}
    stanza.coordinate= {}
    stanza.coordinate.x=0
    stanza.coordinate.y=0
    table.insert(pianoCartesianoStanze, stanza.coordinate)
    listaCreazione= {} --lista di stanze su cui andrà effettuato la chiamata di creazione stanze
    stanza.nome = "scene"..string.format(inizio);
    piano.start= stanza
    local stanzeRimaste= piano.nStanze --ho creato la stanza iniziale, quindi -1

    print("numero stanze di partenza: "..string.format(stanzeRimaste))
    stanzeRimaste= (piano.nStanze - 1) --ho creato la stanza iniziale, quindi -1
    local delta=0 --variabile che evita il blocco nella creazione delle stanza

--variabili per evitare di creare più stanze nella stessa direzione
    local nordSorteggiato= false
    local estSorteggiato= false
    local sudSorteggiato= false
    local ovestSorteggiato= false

--creazione stanze
    for i=1, 4 do
      esisteStanza= math.random((1+ delta),4)  --delta ci assicura che almeno una stanza verrà creata per la stanza di partenza, nella quarta iterazione

      print("---------------------")
      print ("iterazione: "..string.format(i))
      print (esisteStanza==4)

      if esisteStanza==4 then
      local direzione= math.random(1,4)
      local stanzaSorteggiata= math.random(1,10)
      local stanzaTemp = {}
      stanzaTemp.coordinate={}
      local coordinateUtilizzate= {}

      stanzaTemp.nome= "scene"..string.format(stanzaSorteggiata)


      print ("direzione: "..direzione)
      print ("stanza sorteggiata: "..stanzaSorteggiata)
      print("---------------------")

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
print (stanza.nord.nome)
end
if (stanza.est ~= nil) then
print (stanza.est.nome)
end
if (stanza.sud ~= nil) then
print (stanza.sud.nome)
end
if (stanza.ovest ~= nil) then
print (stanza.ovest.nome)
end

print("numero stanze dopo la prima creazione: "..string.format(stanzeRimaste))
print ("coordinate utilizzate:")
for i=1, #pianoCartesianoStanze do
  print (string.format(pianoCartesianoStanze[i].x).." "..string.format(pianoCartesianoStanze[i].y))
end
print("prossime stanze nella creazione:")
for i=1, #listaCreazione do
  print (string.format(listaCreazione[i].nome))
end

--------------------------------crazione altre stanze
local ricorsioneN = 1
creaStanze(stanzeRimaste, pianoCartesianoStanze, listaCreazione, ricorsioneN)
-----------------------------------------------------

torre.primoPiano= piano
piano=nil
piano={}
piano.altezza= 1
--creazioneTorre()

   print ("***************************************fine creazione piano 1********************************************************")
 end

--altri piani


  --elseif piano.altezza==1 then
    --cancello le info

  --else piano.altezza== 2
end



function creaStanze(stanzeRimaste, coordinateStanze, listaCreazione, numero) --stanze rimanenti è un numero
  print("***************************/////*******************")
  print ("numero iterazione"..numero)

local stanzeRimanenti=stanzeRimaste
local pianoCartesiano= coordinateStanze
local bufferCreazione= listaCreazione
print ("stanze rimaste: ".. stanzeRimanenti)
num= numero

if stanzeRimanenti > 0 then
  local stanza= bufferCreazione[num]

  print (stanza.coordinate.x)
  print (stanza.coordinate.y)
  delta = 0
  --variabili per evitare di creare più stanze nella stessa direzione
    local nordSorteggiato= false
    local estSorteggiato= false
    local sudSorteggiato= false
    local ovestSorteggiato= false

  for i=1, 4 do
    esisteStanza= math.random((1+ delta),4)
     print("---------------------")
      print ("iterazione: "..string.format(i))
      print (esisteStanza==4)

    if esisteStanza==4 then
      local direzione= math.random(1,4)
      local stanzaSorteggiata= math.random(1,10)
      local stanzaTemp = {}
      stanzaTemp.coordinate={}
      local coordinateUtilizzate= {}

      print ("direzione: "..direzione)
      print ("stanza sorteggiata: "..stanzaSorteggiata)
      print("---------------------")

      stanzaTemp.nome= "scene"..string.format(stanzaSorteggiata)
      if direzione==1 then
        coordinateUtilizzate.x= stanza.coordinate.x
        coordinateUtilizzate.y= (stanza.coordinate.y + 1)
        print ("is valida:")
        print (verificaCoordinate(coordinateUtilizzate, pianoCartesiano))
        if ((not nordSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0)) then
        stanzaTemp.coordinate.x= coordinateUtilizzate.x
        stanzaTemp.coordinate.y= coordinateUtilizzate.y
        stanza.nord= stanzaTemp
        table.insert(pianoCartesiano, coordinateUtilizzate)
        table.insert(bufferCreazione, stanza.nord)
        nordSorteggiato= true
        print("stanze decrementate")
        stanzeRimanenti = stanzeRimanenti -1
      end
      elseif direzione==2 then
        coordinateUtilizzate.x= (stanza.coordinate.x + 1)
        coordinateUtilizzate.y= stanza.coordinate.y
        print ("is valida:")
        print (verificaCoordinate(coordinateUtilizzate, pianoCartesiano))
        if ((not estSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0)) then
        stanzaTemp.coordinate.x= coordinateUtilizzate.x
        stanzaTemp.coordinate.y= coordinateUtilizzate.y
        stanza.est= stanzaTemp
        table.insert(pianoCartesiano, coordinateUtilizzate)
        table.insert(bufferCreazione, stanza.est)
        estSorteggiato= true
        print("stanze decrementate")
         stanzeRimanenti = stanzeRimanenti -1
      end
      elseif direzione== 3 then
        coordinateUtilizzate.x= stanza.coordinate.x
        coordinateUtilizzate.y= (stanza.coordinate.y -1)
        print ("is valida:")
        print (verificaCoordinate(coordinateUtilizzate, pianoCartesiano))
        if ((not sudSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0)) then
        stanzaTemp.coordinate.x= coordinateUtilizzate.x
        stanzaTemp.coordinate.y= coordinateUtilizzate.y
        stanza.sud = stanzaTemp
        table.insert(pianoCartesiano, coordinateUtilizzate)
        table.insert(bufferCreazione, stanza.sud)
        sudSorteggiato = true
        print("stanze decrementate")
        stanzeRimanenti = stanzeRimanenti -1
      end
      else
        coordinateUtilizzate.x= (stanza.coordinate.x -1)
        coordinateUtilizzate.y= stanza.coordinate.y
        print ("is valida:")
        print (verificaCoordinate(coordinateUtilizzate, pianoCartesiano))
        if ((not ovestSorteggiato) and (verificaCoordinate(coordinateUtilizzate, pianoCartesiano)) and (stanzeRimanenti>0)) then
        stanzaTemp.coordinate.x= coordinateUtilizzate.x
        stanzaTemp.coordinate.y= coordinateUtilizzate.y
        stanza.ovest= stanzaTemp
        table.insert(pianoCartesiano, coordinateUtilizzate)
        table.insert(bufferCreazione, stanza.ovest)
        ovestSorteggiato= true
        print("stanze decrementate")
        stanzeRimanenti = stanzeRimanenti -1
      end
      end
	  end
      delta= delta + 1
  end
else
  return true
end
local newNum= num+1
--table.remove(bufferCreazione, num)
creaStanze(stanzeRimanenti,pianoCartesiano, bufferCreazione, newNum )
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

function partitaS:prova()
  print("****************************PartitaCorrettamenteImportato*****************************************************")
end

function partitaS:aggiungiscore(scoreLivello, tempo, palleRimaste, isGameOver)
  --lo scorelivello è un valore che verrà inviato sia se si ha finito il livello con il gameOver,in quel caso
  --poi verrà chiesto lo score definitivo e stampato a schermo
  --aggiungere un bonus prima di inviare lo score del livello se il giocatore lo ha portato a termine
  local scoreParziale
  scoreParziale = scoreLivello - (tempo) --ogni 5 secondi diminuisce lo score di un valore unitario
  scoreParziale = scoreParziale + (palleRimaste*500)
  if(scoreParziale > 0) then
    score = score + scoreParziale
  end
end

function partitaS:prossimoLivello()
  --return prossimolivello
end


--**************************************Funzioni per ritarnare le variabili locali*****************************************************
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


--**************************************Funzioni per settare le variabili locali**************************************************************

function partitaS:setPG(pg)
personaggio=pg
end



--************************************Salvataggio dati****************************************************************************************




--info:
--channel musica: 2
--channel effetti sonori: 3
