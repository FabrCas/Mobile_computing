_W = display.contentWidth
_H = display.contentHeight

tempoInizioLivello = os.time()


--da cancellare 
require ("lib.partitaStoria")
math.randomseed(os.time())
math.random(); math.random(); math.random()
local torre = partitaS:torre()
stanze_p1= display.newText( "P1 -> nStanze: "..torre.primoPiano.nStanze, _W/2 - 100 ,  70, native.systemFont,12 )
stanze_p2= display.newText( "P2 -> nStanze: "..torre.secondoPiano.nStanze, _W/2 - 100 ,  90, native.systemFont,12 )
stanze_p3= display.newText( "P3 -> nStanze: "..torre.terzoPiano.nStanze, _W/2 - 100 ,  110, native.systemFont,12 )
--

local txt_SpecialeVisibile = false
local txt_Attivo = display.newText( "", display.contentWidth/2 +50 ,  50, native.systemFont,12 )

function livelloBase:new()
print'livelloo'
end

 function livelloBase:prova()
  print("****************************Livello funziona*****************************************************")
end

function livelloBase:funzione(parametro1, parametro2)

end


