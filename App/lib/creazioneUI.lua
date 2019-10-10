local _M = {}
require("lib.LD_LoaderX")
local myLevel = {}
myLevel = LD_Loader:new()
myLevel:loadLevel("ui")
function _M.newUI()
    local buttonPausa = myLevel:getLayerObject("invisible_layer", "buttonPausa").view
    local buttonStats = myLevel:getLayerObject("invisible_layer", "buttonStats").view

    buttonPausa:addEventListener('tap',function(event) physics.pause() isPaused=true end)
    buttonStats:addEventListener('tap',function(event) physics.start() isPaused=false end)
end

return _M
