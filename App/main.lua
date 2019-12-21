-----------------------------------------------------------------------------------------
-- Level Director
-- main.lua
-- Created on lun set 16 15:44:26 2019
-----------------------------------------------------------------------------------------
system.activate("multitouch")
display.setStatusBar( display.HiddenStatusBar )
local preference = require "lib.preference"

--Store numbers
preference.save{danno=1}
preference.save{numeroPalle=8}
preference.save{rimbalzo=8} --/10
preference.save{grandezza=10} --diametro
preference.save{densita=1}
preference.save{fortuna=0}
preference.save{velocita=5} --*100
preference.save{tower=123} --mettere a commento se si vuole salvare la torre x successive partite
    print("valore tower", preference.getValue("tower"))
--Store Tables
--preference.save{d = {1,"2",true}}
--value = preference.getValue("d")
--print("Retrieving table d: ",value[3])

--physics = require ("physics")
--physics.start()
_G.mod_par = nil
local composer = require( "composer" )
composer.imgDir = "images/"
composer.musicDir = "sounds/"
--variabili utili per la selezione delle scene
--non di default
composer.level = 1 --sei nel menu



composer.gotoScene( "toMenu"
	--, "fade", 500
	)
