-----------------------------------------------------------------------------------------
-- Level Director
-- main.lua
-- Created on lun set 16 15:44:26 2019
-----------------------------------------------------------------------------------------
system.activate("multitouch")
display.setStatusBar( display.HiddenStatusBar )

if ( system.getInfo("platformName") == "Android" ) then
   local androidVersion = string.sub( system.getInfo( "platformVersion" ), 1, 3)
   if( androidVersion and tonumber(androidVersion) >= 4.4 ) then
     native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )
     --native.setProperty( "androidSystemUiVisibility", "lowProfile" )
   elseif( androidVersion ) then
     native.setProperty( "androidSystemUiVisibility", "lowProfile" )
   end
end
local socket = require( "socket" )
local preference = require "lib.preference"
require ("lib.partitaStoria")
--Store numbers
preference.save{danno=1}
preference.save{numeroPalle=8} --8
preference.save{rimbalzo=80} --/100
preference.save{grandezza=10} --diametro
preference.save{densita=5} --/10
preference.save{fortuna=0}
preference.save{velocita=5} --*100
--preference.save{tower=123} --mettere a commento se si vuole salvare la torre x successive partite
    print("valore tower", preference.getValue("tower"))

_G.mod_par = nil
_G.f= nil

_G.livelloA=1

if preference.getValue("score") ~= nil then
	partitaS:setScore(preference.getValue("score"))
else 
	partitaS:setScore(0)
end

local composer = require( "composer" )
composer.imgDir = "images/"
composer.musicDir = "sounds/"
--variabili utili per la selezione delle scene
--non di default
composer.level = 1 --sei nel menu


function findPublicIPAddress()
    
    local getipScriptURL = "http://myip.dnsomatic.com/"
    local DeviceIP
    
    function ipListener(event)
        if not event.isError and event.response ~= "" then
            DeviceIP = event.response 
            print("Public DeviceIP:"..DeviceIP)
        end
    end
    
    network.request(getipScriptURL,"GET",ipListener) 
    
end

findPublicIPAddress()

composer.gotoScene( "toMenu"
	--, "fade", 500
	)
