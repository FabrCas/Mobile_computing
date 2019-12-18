-- Generated by Level Director X v1.1.0 on mar dic 17 18:41:53 2019 --
require("lib.LD_HelperX")
local M={}
-----------------------------------
function M:loadAssets()
-----------------------------------
	local assets={}
	assets.spriteSheetData={}
	assets.spriteSheetData['b']={}
	assets.spriteSheetData['b'].frames ={
		{x=1,y=1,width=470,height=472},
		{x=473,y=1,width=470,height=472},
		{x=945,y=1,width=470,height=472},
		{x=1417,y=1,width=470,height=472},
		{x=1,y=475,width=470,height=472},
		{x=473,y=475,width=470,height=472},
		{x=945,y=475,width=470,height=472},
		{x=1417,y=475,width=470,height=472},
		{x=1,y=949,width=470,height=472},
		{x=473,y=949,width=470,height=472},
		{x=945,y=949,width=470,height=472},
		{x=1417,y=949,width=470,height=472},
		{x=1,y=1423,width=470,height=472},
		{x=473,y=1423,width=470,height=472},
		{x=945,y=1423,width=470,height=472},
		{x=1417,y=1423,width=470,height=472},
		sheetContentWidth=1888,
		sheetContentHeight=1896
	}
	assets['b_1']={file ='batuffolo.png',name='b_1',class='',aX=0.5,aY=0.5,width=470,height=472,frame=2,spriteSheetName='b',frameCount=16,
		sequenceData={{name='colorfull',frames={ 2,3,1,4,6,10,14,7,8,11,15,5,9,13 },time =1200,loopCount=0,loopDirection='forward' },},
		sequenceInfo={default='colorfull',play=false },
		 }
	return assets
end -- loadAssets 

------------------------------------------
function M:createLevel(LD_Helper_Instance)
------------------------------------------
	local instance=LD_Helper_Instance
	local objProps={}
	local level={}
    local obj=nil
	local k=0
	local objects = nil 
	if (instance.viewGroup == nil) then
		level.view=display.newGroup() 
	else
		level.view=instance.viewGroup
	end
	level.view.anchorChildren =false 
	display.setDefault( 'background',102/255,102/255,102/255,255/255)
	display.setDefault( "anchorX",0.5 )
	display.setDefault( "anchorY",0.5 )	
	display.setDrawMode("wireframe",false)
	level.name='cottonBall' 
	-- Load Assets
	level.assets=self:loadAssets()
	-- Physics properties
	physics.setGravity(0,9.8) 
	physics.setDrawMode('normal')
	physics.setPositionIterations(8)	
	physics.setVelocityIterations(3)	
	level.parallaxEnabled=false
	-- Layers --
	level.layers={} 
	---- Layer 1 ------------------------------------------------------------------------------------
	level.layers['Layer 1']={} 
	level.layers['Layer 1'].view=display.newGroup() 
	level.layers['Layer 1'].name='Layer 1' 
	if (level.parallaxEnabled) then
		level.layers['Layer 1'].speed={x=0,y=0}
		level.layers['Layer 1'].repeated=false
		level.layers['Layer 1'].cullingMethod=0
	else
		level.layers['Layer 1'].cullingMethod=0 
	end
	local a = 0.147
	level.layers['Layer 1'].objects={} 
	objects = {
	{name='cottonBall',objType='LDImage',class='',width=113,height=113,x=169,y=169,xScale=a,yScale=a,assetName='b_1',
		userProps = {},
		},
	}
	-- add objects to layer
	for k, objProps in pairs (objects) do
		obj = instance:createObject(level.layers['Layer 1'], objProps ,level.assets)
		if (obj and objProps.userProps) then
			obj.property = {}
			for u, userProp in pairs (objProps.userProps) do
				obj.property[userProp.name] = userProp.value 
			end 
		end 
	end
	instance:insertLayer(level,level.layers['Layer 1'])
	--level.ldVersion=1.1.0	-- Level Director Version
	-- Parallax (after layers)
	level.canvasWidth=320
	level.canvasHeight=480
	if level.parallaxEnabled then
		level.parallaxInfinite=false
		level.parallaxDamping=1
		instance:createParallax(level)
	end
	return level
end -- createLevel
return M

