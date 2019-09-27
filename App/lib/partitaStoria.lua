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
  piano=0
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

--************************************Salvataggio dati****************************************************************************************
