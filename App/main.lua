-----------------------------------------------------------------------------------------
-- Level Director
-- main.lua
-- Created on lun set 16 15:44:26 2019
-----------------------------------------------------------------------------------------
system.activate("multitouch")
display.setStatusBar( display.HiddenStatusBar )
local preference = require "lib.preference"
require ("lib.partitaStoria")
--Store numbers
preference.save{danno=10}
preference.save{numeroPalle=12} --8
preference.save{rimbalzo=80} --/100
preference.save{grandezza=10} --diametro
preference.save{densita=5} --/10
preference.save{fortuna=0}
preference.save{velocita=5} --*100
--preference.save{tower=123} --mettere a commento se si vuole salvare la torre x successive partite
    print("valore tower", preference.getValue("tower"))

_G.mod_par = nil
_G.f= nil
_G.livelloA=0

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



composer.gotoScene( "toMenu"
	--, "fade", 500
	)
