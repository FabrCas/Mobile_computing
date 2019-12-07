-----------------------------------------------------------------------------------------
-- Level Director
-- main.lua
-- Created on lun set 16 15:44:26 2019
-----------------------------------------------------------------------------------------
system.activate("multitouch")
display.setStatusBar( display.HiddenStatusBar )

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
