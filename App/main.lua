-----------------------------------------------------------------------------------------
-- Level Director
-- main.lua
-- Created on lun set 16 15:44:26 2019
-----------------------------------------------------------------------------------------
system.activate("multitouch")
display.setStatusBar( display.HiddenStatusBar )

--physics = require ("physics")
--physics.start()

local composer = require( "composer" )
composer.imgDir = "images/"

--variabili utili per la selezione delle scene
--non di default
composer.level = 1 --sei nel menu


local function main()
composer.gotoScene( "toMenu", "fade", 500 )
   return true
end
-- Begin
main()
