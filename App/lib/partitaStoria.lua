--dati della partita in modalità storia
local personaggio
local stats
--local prossimolivello
local livelloAttuale
local livelli --table dove verranno salvati tutti i livelli per piano
local score
local prova="gianna"
local piano
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
  piano= {}
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
 print ("************************************************inizio creazione********************************************************")
  if piano.altezza == 0 then

    local inizio = math.random(1, 10);
    
    piano.nStanze= math.random(5,8)
    stanza= {}
    stanza.nome = "scene"..string.format(inizio);
    piano.start= stanza
    local stanzeRimaste= piano.nStanze

    local delta=0
    for i=1, 4 do
      esisteStanza= math.random((1+ delta),4)  --delta ci assicura che almeno una stanza verrà creata per la stanza di partenza, nella quarta iterazione
      --si possono sovrascrive le stanza, magari esisteStanza è = 4, 3 volte, ma una solo stanza viene memorizzata, perchè tutte e tre vanno nella stassa posizione
      print ("iterazione"..string.format(i))
      print (esisteStanza)

      if esisteStanza==4 then
      local direzione= math.random(1,4)
      local stanzaSorteggiata= math.random(1,10)
      local stanzaTemp = {}
      stanzaTemp.nome= "scene"..string.format(stanzaSorteggiata);

      
      print (direzione)
      print (stanzaSorteggiata)

      if direzione==1 then
        stanza.nord= stanzaTemp
      elseif direzione==2 then
        stanza.est= stanzaTemp
      elseif direzione== 3 then
        stanza.sud = stanzaTemp
      else 
        stanza.ovest= stanzaTemp
      end
    end
    delta= delta+1
  end

if (stanza.nord ~= nil) then 
print (stanza.nord.nome)
stanzeRimaste = stanzeRimaste -1
end 
if (stanza.est ~= nil) then 
print (stanza.est.nome)
stanzeRimaste = stanzeRimaste -1
end
if (stanza.sud ~= nil) then 
print (stanza.sud.nome)
stanzeRimaste = stanzeRimaste-1
end
if (stanza.ovest ~= nil) then 
print (stanza.ovest.nome)
stanzeRimaste = stanzeRimaste-1
end

print(stanzeRimaste)
   -- stanzeRimaste= piano.nStanze -1
   -- for i=1, piano.nStanze do
   --    stanza=1

   print ("************************************************fine creazione********************************************************")
 end

--altri piani


  --elseif piano.altezza==1 then

  --else piano.altezza== 2
end



function creaPiano()


  end



function partitaS:prova()
  print("****************************PartitaCorrettamenteImportato*****************************************************")
end

function partitaS:aggiungiscore(scoreLivello, tempo, palleRimaste, isGameOver)
  --lo scorelivello è un valore che verrà inviato sia se si ha finito il livello con il gameOver,in quel caso
  --poi verrà chiesto lo score definitivo e stampato a schermo
  --aggiungere un bonus prima di inviare lo score del livello se il giocatore lo ha portato a termine
  local scoreParziale
  scoreParziale= scoreLivello - (tempo/5000) --ogni 5 secondi diminuisce lo score di un valore unitario
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

function partitaS:piano()
  return piano
end


--**************************************Funzioni per settare le variabili locali**************************************************************

function partitaS:setPG(pg)
personaggio=pg
end



--************************************Salvataggio dati****************************************************************************************




--info:
--channel musica: 2
--channel effetti sonori: 3
