--dati della partita in modalità storia
local personaggio
local stats
--local prossimolivello
local livelloAttuale
local livelli --table dove verranno salvati tutti i livelli per piano
local score
local prova="gianna"
local piano


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
  --piano.altezza=0
  --creazioneTorre()
end

--[[buffer livelli 30, 10 per piano
--10 al primo , 10 al secondo, 10 al terzo
--numero stanze:
--min:5 max:8
--min:8 max:11
--min:11 max:15
--convenzioni: 1->nord 2->est 3->sud 4->ovest
function creazioneTorre(){
  if piano.altezza == 0 then
    local inizio = math.random(1, 10);
    piano.start= "scene"..string.format(inizio)
    piano.nStanze= math.random(5,8)
    stanze = {}
    stanza= "scene"..string.format(inizio);
    for i=1, 4 do
      esisteStanza= math.random(0,1)
      direzione= math.random(1,4)




      if i=1 then
        stanza.nord=
      elseif i=2 then
        stanza.est=
      elseif i=3 then
        stanza.sud
      else then
        stanza.
    stanze[1]= stanza
    stanzeRimaste= piano.nStanze -1
    for i=1, piano.nStanze do
       stanza=



    end

  elseif piano.altezza==1 then

  elseif piano.altezza==2 then

  end
}--]]


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
