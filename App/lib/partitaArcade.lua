--dati della partita in modalità arcade
--valori standard invariabili per ogni partita

local volumeMusica
local volumeEffettoSonoro


--**************************************Funzioni per ritarnare le variabili locali*****************************************************

function partitaS:personaggio()
  return personaggio
end

function partitaS:volumeMusica()
  return volumeMusica
end

function partitas:volumeEffettoSonoro()
  return volumeEffettoSonoro
end

--**************************************Funzioni per settare le variabili locali**************************************************************

function partitaS:setPG(pg)
personaggio=pg
end

function partitaS:aumentaVolumeMusica()
  volumeMusica= volumeMusica +1
end

function partitaS:diminuisciVolumeMusica()
  volumeMusica= volumeMusica -1
end

function partitaS:aumentaVolumeEffettoSonoro()
  volumeEffettoSonoro= volumeEffettoSonoro +1
end

function partitaS:diminuisciVolumeEffettoSonoro()
  volumeEffettoSonoro= volumeEffettoSonoro -1
end