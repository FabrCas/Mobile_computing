-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
--math.randomseed( os.time() )
_W = display.contentWidth
_H = display.contentHeight n=8
local matrice = {}
 for i=1,n do matrice[i] = {}     -- Creazione matrice
    	for j=1,n do matrice[i][j] = 0 end end

    	 i=1 j=1 for i = 1, n do for j = 1, n do -- Creazione della matrice che si vedrà su schermo
   	--matrice[i][j] = 
   	display.newRect( _W/2 -40 + i*20 , _H/2 - 200 + j*20 , 1 , 1 ) end end
---------------------------------------------------------------------------------
--FUNZIONI VARIE
---------------------------------------------------------------------------------
function downSame(nf) 
	if math.random(0,1000) > 500 then
		return nf-1
		else return nf end end

function upSame(nf)
if math.random(0,1000) > 500 then
		return nf+1
		else return nf end end

function downUpSame(nf)
	local a = math.random( 0,3000 )
	if (a > 0 and a < 1000) then
	return nf 
	elseif (a>999 and a <2000) then return nf+1
    elseif (a > 1999) then return nf-1
	 end end
---------------------------------------------------------------------------------
--FINE FUNZIONI VARIE
---------------------------------------------------------------------------------
x = 5 --math.random( 1, n )
y = 5 --math.random( 1, n )

nMatrice = 1
nStanza = 1

function creaStanza()
 local rect = display.newRect( _W/2 -40 + x*20 , _H/2 - 200 + y*20 , 10 , 10 )
 matrice[x][y] = nMatrice
 nMatrice = nMatrice + 1
 print("stanza creata n = ", nMatrice,"x,y =",x,y)
 --[[
 assegnare poi un listener alla rect che porta alla scena corrispondente al livello
 rect:addEventListener( "tap", function composer.gotoScene ("nomeLivello") 
 ]]
end

   creaStanza()

 function impostaAdiacente()

if math.random(0,100) > 50 then
    vecchiax = x
 	if x==n then x = downSame(x)
 	elseif x==1 then x = upSame(x)
    else x = downUpSame(x) end
 else
    
    vecchiay = y
    if y==n then y = downSame(y)
    elseif y==1 then y = upSame(y)
    else y = downUpSame(y) end
end 

if (vecchiax == x and vecchiay==y) then impostaAdiacente() end
--not(matrice[x][y]==0 )
end

 e = math.random(4,8)
 	print("n random  = " , e)

 for i = 0 , e  do
 	 impostaAdiacente() 
 	 creaStanza()
 end

 for i = 1, n do 
        for j = 1, n do --print(matrice[i][j]) 
   	 
   	end end --print("nMax = " , nMatrice)
   	
 