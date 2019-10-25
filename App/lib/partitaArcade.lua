--dati della partita in modalità arcade
--valori standard invariabili per ogni partita

partitaA = {}
partitaA_mt =  {__index = partitaA}
local volumeMusica
local volumeEffettoSonoro


--**************************************Funzioni per ritarnare le variabili locali*****************************************************

function partitaA:personaggio()
  return personaggio
end

function partitaA:volumeMusica()
  return volumeMusica
end

function partitaA:volumeEffettoSonoro()
  return volumeEffettoSonoro
end

--**************************************Funzioni per settare le variabili locali**************************************************************

function partitaA:setPG(pg)
personaggio=pg
end

function partitaA:aumentaVolumeMusica()
  volumeMusica= volumeMusica +0.1
end

function partitaA:diminuisciVolumeMusica()
  volumeMusica= volumeMusica -0.1
end

function partitaA:aumentaVolumeEffettoSonoro()
  volumeEffettoSonoro= volumeEffettoSonoro +1
end

function partitaA:diminuisciVolumeEffettoSonoro()
  volumeEffettoSonoro= volumeEffettoSonoro -1
end