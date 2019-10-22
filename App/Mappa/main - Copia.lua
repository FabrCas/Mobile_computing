-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
_W = display.contentWidth
_H = display.contentHeight n=3
local matrice = {}
 for i=1,n do matrice[i] = {}     -- create a new row
    	for j=1,n do matrice[i][j] = 0 end end

    	 i=1 j=1 for i = 1, n do for j = 1, n do
   	matrice[i][j] = display.newRect( _W/2 -40 + i*20 , _H/2 - 200 + j*20 , 10 , 10 ) end end
local rect = display.newRect( _W/2, _H/2, 20, 20 )

local rect2 = display.newRect( _W/2, _H/2 + 21, 20, 20 )



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
	if (a >= 1000 and a <2000) then return nf+1
		elseif (a >= 0 and a < 1000) then return nf
		elseif (a >= 2000) then return nf-1 end end

x = math.random( 1, 3 )
y = math.random( 1, 3 )
nMatrice = 1
function creaStanza()
 local rect = display.newRect( _W/2 -40 + x*20 , _H/2 - 200 + y*20 , 10 , 10 )
 matrice[x][y] = nMatrice
 nMatrice = nMatrice + 1
end

   creaStanza()

 function impostaAdiacente()
 	if x==3 then x = downSame(x)
 	else if x==0 then x = upSame(x)
    else x = downUpSame(x) end

    if y==3 then y = downSame(y)
    elseif y==0 then y = upSame(y)
    else y = downUpSame(y) end

end
 
 for i = 0 , math.random(4,8) do
 if math.random (0,100) > 50 then
 	 impostaAdiacente() creaStanza()
 	end
 end